module ApplicationHelper 
  
  def link_class(options)
    ((options[:controller] == params[:controller]) && (options[:action] == params[:action]) && (true || (params[:type] && params[:type] == options[:type]))) ? "active" : ""
  end  
end
