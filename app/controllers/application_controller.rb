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
    url =  book_url(id: params[:id], tab: 'read') if controller_name == 'darviewer'
    session[:return_to] = url
  end

  def redirect_to_user_show_if_logged_in
    redirect_to({ controller: 'users', action: 'show', id: session[:user_id] }) if logged_in?
  end

  def bhl_verify_recaptcha
    verify_recaptcha(timeout: 100)
  end

  def resource_not_found
    redirect_to root_path , flash: {error: I18n.t("msgs.resource_not_found")}
  end

  def unauthorized_action
    redirect_to root_path, flash: {error: I18n.t('common.unauthorized_action')}
  end

  def redirect_to_back_or_default(default = root_url)
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end  
  
  def self.manage_redirect(options = {})
    host = options.delete(:host)
    
    before_filter(options) do     
      port = HTTPS_PORT
      redirect_options = {:protocol => 'https://', :status => :moved_permanently}
      redirect_options.merge!(:port => port) if port # <= this is also new
      redirect_options.merge!(:host => host) if host
      redirect_options.merge!(:params => request.query_parameters)
      redirect_to redirect_options
    end
    
    # before_filter(options) do
      # if !request.ssl? && !allow_http?
        # port = HTTPS_PORT
        # redirect_options = {:protocol => 'https://', :status => :moved_permanently}
        # redirect_options.merge!(:port => port) if port # <= this is also new
        # redirect_options.merge!(:host => host) if host
        # redirect_options.merge!(:params => request.query_parameters)
        # redirect_to redirect_options
      # end
      # if request.ssl? && allow_http?
        # port = HTTP_PORT
        # redirect_options = {:protocol => 'http://'}
        # redirect_options.merge!(:port => port) if port # <= this is also new
        # redirect_options.merge!(:host => host) if host
        # redirect_options.merge!(:params => request.query_parameters)
        # redirect_to redirect_options
      # end
    # end
  end
  
  
  
  protected
    def allow_http?
      true
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
    
    manage_redirect
    
end
