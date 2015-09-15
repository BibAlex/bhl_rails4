module ApplicationHelper
  
  def render_header
    # Rails.cache.fetch("header_#{session[:user_id]}", expires_in: 1.minutes) do
      render partial: "layouts/header"
    # end
  end
  
  def is_active?(options)
    ((options[:controller] == params[:controller]) && (options[:action] == params[:action]) && (params[:type] && params[:type] == options[:type])) ? true : false
  end
  
end
