module ApplicationHelper
  
  def render_header
    if output = read_fragment("header_#{session[:user_id]}")
      output
    else
      render partial: "layouts/header"
    end    
  end
  
  def link_class(options)
    ((options[:controller] == params[:controller]) && (options[:action] == params[:action]) && (true || (params[:type] && params[:type] == options[:type]))) ? "active" : ""
  end  
end
