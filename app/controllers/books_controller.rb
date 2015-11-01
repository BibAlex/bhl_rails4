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
    query = set_query_string(@query_array)
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
end