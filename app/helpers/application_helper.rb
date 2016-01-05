module ApplicationHelper 
  
  def link_class(options)
    ((options[:controller] == params[:controller]) && (options[:action] == params[:action]) && (true || (params[:type] && params[:type] == options[:type]))) ? "active" : ""
  end
  
  def get_class_for_sort_option(sort_param, sort_type)
    sort_param && sort_param.include?(sort_type) ? "" : "display:none"
  end
  
  def get_class_for_active_sort_option(sort_param, sort_type)
    sort_param && sort_param.include?(sort_type) ? "display:none" : ""
  end
  
  def toggle_sort_option(sort_direction)
    sort_direction && sort_direction == "desc" ? "asc" : "desc"
  end
  

  
end
