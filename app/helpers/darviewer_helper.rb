module DarviewerHelper
  
  def get_annotations(params)
    guid = params[:SSOToken]
    user = User.find_by_guid(guid)
    jobid = params[:PID].gsub("DAF-Job:", "")
    jsonArray = []
    annotations = Annotation.where(user_id: user.id, volume_id: jobid)
    
    annotations.each do |annotation|
      element = {'Color' => annotation.color != nil ? annotation.color : "" ,
                'ID' => annotation.id != nil ? annotation.id : "" , 
                'PID' => annotation.volume_id != nil ? "DAF-Job:#{annotation.volume_id}" : "",
                'Text' => annotation.text ? annotation.text : "",
                'Height' => annotation.height != nil ? annotation.height : "",
                'LocX' => annotation.location_x != nil ? annotation.location_x : "",
                'LocY' => annotation.location_y != nil ? annotation.location_y : "",
                'Page' => annotation.page != nil ? annotation.page : "",
                'HLType' => annotation.hltype != nil ? annotation.hltype : "",
                'Width' => annotation.width != nil ? annotation.width : "",
                'ZOrder' => annotation.zorder != nil ? annotation.zorder : "",
                'Type' => annotation.anntype != nil ? annotation.anntype : "",
                'PageList' => annotation.basketpages != nil ? annotation.basketpages : "",
      }  
      jsonArray << element
    end
    jsonArray
  end
  
  def save_annotation(params)
    guid = params[:SSOToken]
    user = User.find_by_guid(guid)
    jobid = params[:PID].gsub('DAF-Job:', "")
    
    #For spelling mistake of Height "Hight" in the dar team
    height = params[:Height] ? params[:Height] : params[:Hight] ? params[:Hight] : nil
    attributes = {
      'volume_id' => jobid != nil ? jobid : nil, 
      'page' => params[:Page] != nil ? params[:Page] : nil,
      'text' => params[:Text] != nil ? params[:Text] : nil, 
      'anntype' => params[:Type] != nil ? params[:Type] : nil,
      'location_x' => params[:LocX] != nil ? params[:LocX] : nil,
      'location_y' => params[:LocY] != nil ? params[:LocY] : nil,
      'height' => height != nil ? height : nil,
      'width' => params[:Width] != nil ? params[:Width] : nil,
      'zorder' => params[:ZOrder] != nil ? params[:ZOrder] : nil,
      'hltype' => params[:HL_Type] != nil ? params[:HL_Type] : nil,
      #for my basket
      'basketpages' => params[:MyBasket_PagesList] != nil ? params[:MyBasket_PagesList] : nil,
      #save user  
      'user_id' => user.id
    }
    
    annotation = Annotation.create(attributes)
    jsonArray = params[:TID] != nil ? {'ID' => "#{annotation.id}", 'TID' => params[:TID]} : {'ID' => "#{annotation.id}"}  
    
  end
  
  def edit_annotation(params)
    id = params[:ID] != nil ? params[:ID] : params[:MyBasket_ID]
    annotation = Annotation.find(id)
    
    jobid = params[:PID] != nil ? params[:PID].gsub('DAF-Job:', "") : nil
    
    #For spelling mistake of Height "Hight" in the dar team
    height = params[:Height] != nil ? params[:Height] : params[:Hight] != nil ? params[:Hight] : nil
    
    attributes = {
      'id' => id,
      'volume_id' => jobid  != nil ? jobid : nil, 
      'page' => params[:Page] != nil ? params[:Page] : nil,
      'text' => params[:Text] != nil ? params[:Text] : nil, 
      'anntype' => params[:Type] != nil ? params[:Type] : nil,
      'location_x' => params[:LocX] != nil ? params[:LocX] : nil,
      'location_y' => params[:LocY] != nil ? params[:LocY] : nil,
      'height' => height != nil ? height : nil,
      'width' => params[:Width] != nil ? params[:Width] : nil,
      'zorder' => params[:ZOrder] != nil ? params[:ZOrder] : nil,
      #'date' => params[:Note_Date] != nil ? params[:Note_Date] : nil,
      'hltype' => params[:HL_Type] != nil ? params[:HL_Type] : nil,
      #for my basket
      'basketpages' => params[:MyBasket_PagesList] != nil ? params[:MyBasket_PagesList] : nil
    }
    attributes.delete("volume_id") if attributes["volume_id"].nil?
    success = annotation.update_attributes(attributes)
    jsonArray = params[:TID] != nil ? {'Succeeded' => success,'TID' => params[:TID]} : {'Succeeded' => "#{success}"}
  end
  
  def remove_annotation(params)
    debugger
    guid = params[:SSOToken]
    user = User.find_by_guid(guid)
    
    success = false
    begin
      annotation = Annotation.find params[:ID]
    rescue ActiveRecord::RecordNotFound => e
      annotation = nil
    end
    if annotation != nil && annotation.delete() != nil
      success = true
    end
    jsonArray = {'Succeeded' => success,'TID' => params[:TID]}
  end
end