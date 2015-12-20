class DarviewerController < ApplicationController
  
  protect_from_forgery except: [:book, :user, :annotations] 
  
  include SolrHelper
  include DarviewerHelper
  include BooksHelper
  
  def user
    guid = params[:SSOToken]
    validate = false
    
    if(guid != nil && guid == cookies[:SSid].to_s)  #ask why session[:active] is not read
      validate = true       
    end
    render :json =>  { 'Valid' => ["#{validate}"] }.to_json, :callback => params[:callback]  
  end
  
  def book
    pid = params[:PID]
    jobid = pid.gsub("DAF-Job:", "")    
    jsonArray = load_volume_from_solr(jobid)
    jsonArray["Language"] = jsonArray.delete(:language)
    jsonArray["Subjects"] = jsonArray.delete(:subject)
    jsonArray["Authors"] = jsonArray.delete(:author)
    jsonArray["Title"] = jsonArray.delete(:title)
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
    render :json => j.encode(jsonArray), :callback => params[:callback]
  end
end