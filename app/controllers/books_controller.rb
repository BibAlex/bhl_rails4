require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  include ApplicationHelper
  include BooksHelper
  include SolrHelper
  
  def index
    @page = params[:page] ? params[:page].to_i : 1
    @view = params[:view] ? params[:view] : ''
    @sort = params[:sort_type] ? params[:sort_type] : '' # get sort options (rate or views) from params
    
    @query_array = fill_query_array(params)
    query = set_query_string(@query_array, " AND ")
    @response = search_volumes(query, @page, PAGE_SIZE, @sort)
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
    @volume = load_volume_from_solr(params[:id])
    @types = { author: I18n.t('common.author'), subject: I18n.t('common.subject'), publisher: I18n.t('common.publisher') }
    @user_rate = Rate.load_user_rate(session[:user_id], params[:id], "volume")
    @collections_count = Collection.get_count_by_volume(params[:id], session[:user_id])
     if(session[:book_id] != nil && session[:book_id] != params[:id].to_i)
       if BookView.where(source_book_id: params[:id].to_i, dest_book_id: session[:book_id]).blank? && 
          BookView.where(source_book_id: session[:book_id], dest_book_id: params[:id].to_i).blank?
         source_book_title = BooksHelper.find_field_in_document(session[:book_id], "title")[0]
         BookView.create(source_book_id: session[:book_id], dest_book_id: params[:id].to_i, source_book_title: source_book_title, dest_book_title: @volume[:title][0])
      end
    end
    session[:book_id] = params[:id].to_i
    @comment = Comment.new
  end  
end