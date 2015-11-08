module ApplicationHelper 
  
  def link_class(options)
    ((options[:controller] == params[:controller]) && (options[:action] == params[:action]) && (true || (params[:type] && params[:type] == options[:type]))) ? "active" : ""
  end
  
  def get_class_for_sort_option(sort_param, sort_type)
    if(sort_param && (sort_param.include?sort_type))
      ""
    else
      "display:none"
    end
  end
  
  def get_class_for_active_sort_option(sort_param, sort_type)
    if(sort_param && (sort_param.include?sort_type))
      "display:none"
    else
      ""
    end
  end
  
  def toggle_sort_option(sort_param, sort_type)
    sort_option = ''
    if(sort_param && (sort_param.include?sort_type))
      sort_parts = sort_param.split(" ")
      sort_option = "ASC" if sort_parts[1] == "DESC"
      sort_option = "DESC" if sort_parts[1] == "ASC"
    else
      sort_option = "DESC"
    end
    sort_option
  end
  
end
