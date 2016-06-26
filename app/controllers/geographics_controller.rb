class GeographicsController < ApplicationController
  include SolrHelper

  before_filter :initialize_rsolr

  def index
    @page_title = I18n.t('common.geographics')
    @icons = {
      100 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_blue')}",
      200 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_green')}",
      300 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_yellow')}",
      400 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_orange')}",
      500 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_red')}"
      }
  end
  
  
  def load_books
    books_locations = []
    range = params[:range] ? params[:range] : "100,200,300,400,500"
    @icons = {
      100 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_blue')}",
      200 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_green')}",
      300 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_yellow')}",
      400 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_orange')}",
      500 => "/assets/images_#{I18n.locale}/#{I18n.t('geographics.map_pin_red')}"
      }
    
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

      if range.include?(icon_in.to_s)

        values= item.value.split(",") #"city, longitude, latitude"
        location = load_geolocations_from_solr(item.value)

         unless location.nil?
          books_locations << { latitude: location[:latitude],
                                longitude: location[:longitude],
                                address: location[:address],
                                icon: @icons[icon_in],
                                category: icon_in}
         end
      end
    end
    render json: books_locations
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
