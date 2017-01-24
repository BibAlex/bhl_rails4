require 'net/http'


class DarviewerController < ApplicationController
  
   protect_from_forgery except: [:book, :user, :annotations, :fake_request] 
  
  include SolrHelper
  include DarviewerHelper
  include BooksHelper

  def fake_request    
    uri = URI("https://viewer2.bibalex.org/LoadBalancer/JobLocation/#{params[:book_id]}/Host?callback=getLoadBalancer")    
    #uri = URI("http://www.google.com")
    response = Net::HTTP.get(uri)
    respond_to do |format|      
       format.js { render :json => response.sub("http", "https")}    
    end
  end
  
  def user
    guid = params[:SSOToken]
    validate = false
    
    if(guid != nil && guid == cookies[:SSid].to_s)  #ask why session[:active] is not read
      validate = true       
    end
    render :json =>  { 'Valid' => ["#{validate}"] }.to_json, :callback => params[:callback]  
  end
  
  def book
    if params[:PID]
      pid = params[:PID]
      jobid = pid.gsub("DAF-Job:", "")    
      jsonArray = load_volume_with_names_from_solr(jobid)
      jsonArray["Language"] = jsonArray.delete(:language)
      jsonArray["Subjects"] = jsonArray.delete(:subject)
      jsonArray["Authors"] = jsonArray.delete(:author)
      jsonArray["Title"] = jsonArray.delete(:title)
    else
      jsonArray = ""
    end
    render :json =>  jsonArray.to_json, :callback => params[:callback]
  end
  
  def annotations
    case params[:callback] 
    when "getAnnotations"
      jsonArray = get_annotations(params)
    when "saveNote", "saveHighlight", "saveMyBasket"
      jsonArray = save_annotation(params)
    when "editNote", "editMyBasket"
      jsonArray = edit_annotation(params)
    when "removeNote", "removeHighlight", "removeMyBasket"
      jsonArray = remove_annotation(params)
    end
    j = ActiveSupport::JSON
    res = jsonArray.nil? ? "" : j.encode(jsonArray)
    render :json => res, :callback => params[:callback]
  end
end
