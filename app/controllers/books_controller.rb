require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  include ApplicationHelper
  include BooksHelper
  include SolrHelper
  include UsersHelper
  before_filter :store_location, only: [:show]

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @view = params[:view] ? params[:view] : ''
    @sort = params[:sort_type] ? params[:sort_type] : '' # get sort options (rate or views) from params

    @query_array = fill_query_array(params)
    query = set_query_string(@query_array)
    fquery = set_fquery_string(@query_array)
    @response = search_volumes(query, @page, PAGE_SIZE, @sort, fquery, params["_all"].blank?)
    @books = WillPaginate::Collection.create(@page, PAGE_SIZE, @response[:total_number_of_volumes]) do |pager|
      pager.replace @response[:volumes]
    end
    title = get_page_title_of_search(@query_array)
    @page_title = title.blank? ? I18n.t('common.list_all_books') : "#{I18n.t('common.search_by')} ( #{title} )"
  end

  def autocomplete
    @results = []
    if params[:type] && params[:term]
      response = solr_autocomplete(params[:type], params[:term], AUTOCOMPLETE_MAX)
      response.each do |item|
        @results << item.value
      end
    end
    if (@results.empty?)
      @results << "#{I18n.t('msgs.no_suggestion')}"
    end
    render json: @results
  end

  def show
    tab = params[:tab] == "read" ? "read" : "details"
    load_volume_details(tab)
    if tab == "read"
      load_read_page(params[:search_name])
    else
      load_details_page
    end

  end

  private

  def load_volume_details(tab)
    @volume = load_volume_with_names_from_solr(params[:id])
    @page_title = "#{@volume[:title][0]} - #{I18n.t("common.#{tab}")}"
    @page_author = @volume[:author].join(",") if @volume[:author]
    @page_description = ""
    @volume[:sci_names].each do |name|
      if(@page_description.length + name.length + 1 <= 100)
        @page_description += name + ","
      else
        break
      end
    end
    @page_description = @page_description[0..@page_description.length-2]
  end

  def load_details_page
    @types = { author: I18n.t('common.author'), subject: I18n.t('common.subject'), publisher: I18n.t('common.publisher') }
    @user_rate = Rate.load_user_rate(session[:user_id], params[:id], "volume")
    @collections_count = Collection.get_count_by_volume(params[:id], session[:user_id])
    save_book_also_viewed(params)
    @comment = Comment.new
  end

  def save_book_also_viewed(params)
    BookView.save_book_also_viewed(params, session[:book_id], @volume)
    session[:book_id] = params[:id].to_i
  end

  def load_read_page(search_name)
    UserVolumeHistory.save_user_history(params[:id], session[:user_id]) if is_logged_in?
    @book_name = @volume[:title][0]
    @reader_path = (DAR_JAR_API_URL.sub DAR_JAR_API_URL_STRING, params[:id]).sub DAR_JAR_API_URL_LANGUAGE, I18n.locale.to_s
    @reader_path += "&keyword=#{search_name}"
  end

  def get_page_title_of_search(query_array)
    query_arr = []
    query_array.each do |key, val|
      unless val.blank?
        search_type = I18n.t("common.#{key}")
        query_arr << "#{search_type}: #{val.join(",")}"
      end
    end
    query_arr.join(" - ")
  end
end