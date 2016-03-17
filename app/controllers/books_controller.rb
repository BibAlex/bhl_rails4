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
  end

  def autocomplete
    @results = []
    response = solr_autocomplete(params[:type], params[:term], AUTOCOMPLETE_MAX)
    response.each do |item|
      @results << item.value
    end
    if (@results.empty?)
      @results << "#{I18n.t('msgs.no_suggestion')}"
    end
    render json: @results
  end

  def show
    load_volume_details
    if params[:tab] == "read"
      load_read_page
    else
      load_details_page
    end

  end

  private

  def load_volume_details
    @volume = load_volume_with_names_from_solr(params[:id])
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

  def load_read_page
    UserVolumeHistory.save_user_history(params[:id], session[:user_id]) if is_logged_in?
    @reader_path = (DAR_JAR_API_URL.sub DAR_JAR_API_URL_STRING, params[:id]).sub DAR_JAR_API_URL_LANGUAGE, I18n.locale.to_s
  end
end