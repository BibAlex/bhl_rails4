class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale  
  
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