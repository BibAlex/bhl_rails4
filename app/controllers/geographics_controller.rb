class GeographicsController < ApplicationController
  include SolrHelper

  before_filter :initialize_rsolr

  def index

    @page_title = I18n.t('common.geographics')
    @map = Cartographer::Gmap.new('map' , zoom: 2)
    @header = Cartographer::Header.new.to_s
    @range = params[:range] ? params[:range] : "100,200,300,400,500"
    @icons = {
      100 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_blue')}",
      200 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_green')}",
      300 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_yellow')}",
      400 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_orange')}",
      500 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_red')}"
      }
    # defining icons
    gicons = {}
    [100, 200, 300, 400, 500].each do |i|
      temp_icon = Cartographer::Gicon.new( name: "icon_#{i-10}_to_#{i}", image_url: "#{@icons[i]}",
                                           width: 12, height: 20,
                                           shadow_width: 0, shadow_height: 0, #removing shadow
                                           anchor_x: 6, #width/2
                                           anchor_y: 20)
      gicons[i] = temp_icon
      @map.icons << temp_icon
    end
    response = @rsolr.find q: "*:*", facet: true, 'facet.field' => 'location_facet', rows: 0, 'facet.limit' => 30
    response.facets.first.items.each_with_index do |item, index|
      # specify icon
      case item.hits
      when 1..100
          icon_in = 100
      when 101..200
          icon_in = 200
      when 201..300
          icon_in = 300
        when 301..400
          icon_in = 400
        else
          icon_in = 500
      end

      if @range.include?(icon_in.to_s)

        values= item.value.split(",") #"city, longitude, latitude"
        location = load_geolocations_from_solr(item.value)

         unless location.nil?
          @map.markers << Cartographer::Gmarker.new( name:  "geo_marker_#{index}", marker_type: "Building",
                            position: [location[:latitude],location[:longitude]],
                            info_window_url: "/geographics/show/#{location[:address]}",
                            icon: gicons[icon_in])
         end
      end
    end
  end

  def show
    @address = params[:address]
    location = load_geolocations_from_solr(@address)
    @location_name = location[:formatted_address] unless location.nil?
    response = @rsolr.find q: "location_facet:\"#{@address}\""
    @books = {}
    @books_count = response.total
    response.docs.each do |doc|
      title = BooksHelper.find_field_in_document(doc["job_id"], :title.to_s).first
      @books[doc["job_id"]] = title
    end
      render layout: 'main' # this is a blank layout as I don't need any layout in this action
  end

  private

  def initialize_rsolr
    @rsolr = RSolr.connect url: SOLR_BOOKS_METADATA
  end
end
