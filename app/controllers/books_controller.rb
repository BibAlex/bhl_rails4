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
  
  def show
    @volume = load_volume_from_solr(params[:id])
    @types = { author: I18n.t('common.author'), subject: I18n.t('common.subject'), publisher: I18n.t('common.publisher') }
    
    
        # @comment = Comment.new
#     
    # #Save old and new books ids for "user_also_viewed" feature
    # if(session[:book_id] != nil && session[:book_id] != params[:id].to_i)
      # BookView.create(:book_id1 => session[:book_id], :book_id2 => params[:id].to_i)
    # end
    # session[:book_id] = params[:id].to_i
    # #end
#     
    # if @volume[:get_thumbnail_fail] == 0
      # @thumb = "volumes/#{params[:id]}/thumb.jpg"
    # else
      # @thumb = "images_#{I18n.locale}/#{I18n.t(:default_book)}"
    # end
#       
    # #For SEO purpose
    # book_module = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id)
    # @meta_keywords = book_module.meta_keywords
    # @meta_description = book_module.meta_description
    # @meta_author = book_module.meta_author
    # #End SEO
#     
#     
    # if params[:tab] != 'read'
      # #Hash types holds some of the metadata "types" of a book 
      # #(in particularly, the types that are saved in arrays in solr indexing)
      # @types = {:author => I18n.t(:book_author_title), 
                # :geo_location => I18n.t(:book_publish_place_title),
                # :subject => I18n.t(:book_subject_title),
               # }
    # else #If tab is read (darviewer application)
      # #save user history
      # save_user_history(params)
      # @reader_path = (DAR_JAR_API_URL.sub DAR_JAR_API_URL_STRING, params[:id]).sub DAR_JAR_API_URL_LANGUAGE, I18n.locale.to_s
    # end
#     
    # # when user rate == 0 this means that he never rated this book before
    # @user_rate = 0.0
    # if !session[:user_id].nil?
      # book_rate_list = VolumeRating.where(:user_id => session[:user_id], :volume_id => @volume.id)
      # if book_rate_list.count > 0
        # @user_rate = book_rate_list[0].rate 
      # end
    # end    
#     
    # @collections_count = Collection.get_count_by_volume(@volume_id, session[:user_id])
    # @collectionspages = ( @collections_count / LIMIT_CAROUSEL.to_f).ceil
    # @viewspages =  (@volume.view_count / LIMIT_CAROUSEL.to_f).ceil
    # response = rsolr.find :q => get_solr_related(params[:id]), :fl => "vol_jobid"
    # @relatedpages = ((response['response']['numFound']) / LIMIT_CAROUSEL.to_f).ceil

  end
  
  def detailed_rate
    @rate_array=[]
      (1..5).each do |n|
        @rate_array <<  VolumeRating.where(:rate => n.to_f, :volume_id => Volume.find_by_job_id(params[:jobid])).count
      end
    respond_to do |format|
      format.html {render :partial => "books/detailed_rate"}
    end
  end
end