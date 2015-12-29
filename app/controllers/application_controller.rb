class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  
  def check_authentication
    must_log_in unless logged_in?
    return false
  end
  
  def logged_in?
    session[:user_id]
  end
  
  def must_log_in
    respond_to do |format|
      format.html { store_location; redirect_to login_users_path }
      format.js   { render partial: 'content/must_login', layout: false }
    end
    return false
  end
  
  def store_location(url = url_for(controller: controller_name, action: action_name))
    url = nil unless url =~ /\A([%2F\/]|#{root_url})/
    session[:return_to] = url
  end
  
  def redirect_to_user_show_if_logged_in
    redirect_to({ controller: 'users', action: 'show', id: session[:user_id] }) if logged_in?
  end
  
   private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
    
    def set_locale
      I18n.locale = params[:locale] ||session[:locale] || nil
      if session[:user_id]
        I18n.locale =  I18n.locale || User.find_by_id(session[:user_id])[:last_login_language]
      end
      I18n.locale = I18n.locale || extract_locale_from_accept_language_header || I18n.default_locale
      if (params[:locale].nil? && session[:user_id].nil? && session[:locale].nil?)
        Rails.application.routes.default_url_options[:locale]= nil 
      else
        Rails.application.routes.default_url_options[:locale]= I18n.locale 
      end
      session[:locale] =  I18n.locale
      if session[:user_id]
        user = User.find_by_id(session[:user_id])
        user.update_attributes(last_login_language: I18n.locale)
      end
    end   
end
