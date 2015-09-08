class BrowseController < ApplicationController
  
  include SolrHelper
  include BrowseHelper
  layout 'browse'  
  
  def index
    @alphas = ('A' .. 'Z').to_a
    if (params[:char].nil? || params[:char] == 'all')
      @char = ''
    else
      @char = params[:char]
    end
    @prefixes_with_values = Rails.cache.fetch("browse_#{params[:type]}_#{@char}", :expires_in => 5.minutes) do
      browse_list = browse_facet(params[:type].singularize, @char.downcase)
      get_prefixes_of_results(browse_list)
    end
  end
  
end