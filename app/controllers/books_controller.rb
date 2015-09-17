require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  include ApplicationHelper
  include BooksHelper
  include SolrHelper
  # include BHL::Login
  
  def index
    
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