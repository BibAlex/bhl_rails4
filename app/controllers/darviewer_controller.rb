class DarviewerController < ApplicationController
  
  protect_from_forgery except: :book
  
  include SolrHelper
  include DarviewerHelper
  include BooksHelper
  
  def user
    guid = params[:SSOToken]
    validate = false
    
    if(guid != nil && guid == cookies[:SSid].to_s)  #ask why session[:active] is not read
      validate = true       
    end
    @json = "#{params[:callback]}({'Valid':[#{validate}]});"
    #render layout: 'darviewer'
  end
  
  def book
    pid = params[:PID]
    jobid = pid.gsub("DAF-Job:", "")
    # volume = Volume::find_by_job_id(jobid)
    
    jsonArray = load_volume_from_solr(jobid)
    # bookdata = solr_search("vol_jobid:#{volume.job_id}", "bok_title, author, subject, bok_start_date, bok_start_date, bok_language, author")
    # if(bookdata != nil)
      # jsonArray = {
        # :Subject => bookdata['subject'] != nil ? bookdata['subject'] : "", 
        # :PublicationDate => bookdata['bok_start_date'] != nil  ? bookdata['bok_start_date'] : "",
        # :Project => 'Biodiversity Heritage Library',
        # :Language => bookdata['bok_language'] != nil  ? bookdata['bok_language'] : "",
        # :Authors => bookdata['author'] != nil ? bookdata['author'] : "",
        # :Title => bookdata['bok_title'] != nil ? bookdata['bok_title'][0] : ""
      # }
    # end
    # arr = { "Subjects" => "[Liver--Cancer--Etiology., Liver--Cancer--Research--Methodology., Liver--Cancer.]",
            # "Contributor" => "Bibliotheca Alexandrina",
            # "ISBN" => "",
            # "PublicationDate" => "2000.",
            # "Project" => "Million Book Project",
            # "CallNumber" => "",
            # "Language" => "English",
            # "Authors" => "Gazy, Hayam Fathy Abd El-Hay.",
            # "Publishers" => "",
            # "Keywords" => "[   Liver Cancer Etiology.   Liver Cancer Research Methodology.   Liver Cancer.]",
            # "Title" => "Hepatocellular carcinoma update" }
    # @json = params[:callback] + "(" + jsonArray.to_json  + ");"
    # @json = params[:callback] + "(" + arr.to_json  + ");"
    render :json =>  jsonArray.to_json, :callback => params[:callback]
    
    # respond_to do |format|      
      # format.json { render json: @json, :callback => params[:callback] }
      # # format.js { }
    # end
    
    
  end
  
  def annotations
    @json = ""
    @jsonArray = {}
    
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
    @json = params[:callback] + "(" + j.encode(jsonArray)  + ")"  
  end
end