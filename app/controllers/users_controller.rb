class UsersController < ApplicationController
  
  include UsersHelper
  include BHL::Login
  
  def login
    session[:login_attempts] ||= 0
    @verify_captcha = true if (session[:login_attempts].to_i  >= LOGIN_ATTEMPTS)
  end
  
  def logout
    log_out
    redirect_to root_path
  end
  
  #GET /users/forgot_password
  def forgot_password
    redirect_to user_path(id: session[:user_id]) if is_logged_in?
    @page_title = I18n.t('header.pages.forgot_password')
  end
  
  # POST /users/recover_password
  def recover_password
    return redirect_to user_path(id: session[:user_id]) if is_logged_in?
    if verify_recaptcha
      @user = User.find_by_email(params[:user][:email])# unless @email
      if @user
        @user.change_activation_code
        send_reset_password_email
        redirect_to login_users_path, flash: { notice: I18n.t('header.user.recover_password_success') }
      else
        redirect_to forgot_password_users_path, flash: { error: I18n.t('header.user.email_not_found', email: @email) }
      end
    else
      redirect_to forgot_password_users_path, flash: { error: I18n.t('msgs.recaptcha_error') }
    end
  end
  
  def reset_password
    return redirect_to user_path(id: session[:user_id]) if is_logged_in?
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])
    if @user
      @page_title = I18n.t('header.pages.reset_password')
    else
      redirect_to root_path, flash: { error: I18n.t('msgs.reset_password_failed') }
    end
  end
  
  def reset_password_action
    return redirect_to user_path(id: session[:user_id]) if is_logged_in?
    @user = User.find_by_guid_and_verification_code(params[:user][:guid], params[:user][:activation_code])
    if @user
      @user.entered_password = params[:user][:entered_password]
      @user.entered_password_confirmation = params[:user][:entered_password_confirmation]
      if @user.save
        redirect_to login_users_path, flash: {notice: I18n.t('msgs.reset_password_success')}
      else
        redirect_to "/users/reset_password/#{params[:user][:guid]}/#{params[:user][:activation_code]}",
          flash: {error: @user.errors.full_messages.join("<br>")}
      end
    else
      redirect_to root_path, flash: { error: I18n.t('msgs.reset_password_failed') }
    end
  end
  
    # POST /users/validate
  def validate
    if (session[:login_attempts].to_i >= LOGIN_ATTEMPTS) && !(verify_recaptcha)
      redirect_to controller: 'users', action: 'login', flash: { error: I18n.t('msgs.recaptcha_error') }
    else
      @user = User.authenticate(params[:user][:username], params[:user][:password])
      if @user.nil?
        failed_validation
      else
       successful_validation
      end
    end
  end

  
  def new
    if session[:failed_user]
      @user = User.new(User.user_params(session[:failed_user]))
      @user.valid?
      session[:failed_user] = nil
    else
       @user = User.new
    end
    @verify_captcha = true
  end
  
  def create
    params[:user][:photo_name] = User.process_user_photo_name(params[:user][:photo_name])    
    @user = User.new(User.user_params(params[:user]))
    if @user.valid? && verify_recaptcha
      handle_successful_registration
    else
      handle_failed_registration
    end
  end
  
  # GET /users/activate/:guid/:activation_code
  def activate
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])
    return redirect_to root_path, flash: { error: I18n.t('msgs.activation_failed') } if @user.nil?
    if @user.active
      redirect_to root_path, flash: { error: I18n.t('msgs.account_already_active') }
    else
      activate_user
    end
  end
  
  def show
    load_user
    send("load_#{@tab}_tab") unless @tab == "profile"
  end
  
  def get_user_profile_photo
     @user = User.find(params[:id])
     if (User.can_edit?(@user.id, session[:user_id]) && params[:is_delete].to_i == 1)
      @user.delete_photo
     end
     respond_to do |format|
       format.html { render partial: "users/get_user_profile_photo" }
     end
  end

  
  private
  
  def handle_successful_registration
    @user.save
    send_registration_confirmation_email
    redirect_to root_path, flash: { notice: I18n.t('msgs.registration_welcome_message', real_name: @user.real_name) }
  end
  
  def handle_failed_registration
    @user.errors.add('recaptcha', I18n.t('msgs.form_validation_errors_for_attribute_assistive')) unless verify_recaptcha
    session[:failed_user] = params[:user]
    redirect_to controller: "users", action: "new"
  end
  
  def send_registration_confirmation_email
    url = "#{request.host}/users/activate/#{@user.guid}/#{@user.verification_code}"
    # Notifier.user_verification(@user, url).deliver_now
  end
  
  def send_reset_password_email
    url = "#{request.host}/users/reset_password/#{@user.guid}/#{@user.verification_code}"
    #Notifier.user_verification(@user, url).deliver_now
  end
  
  def activate_user
    @user.activate
    # Notifier.user_activated(@user).deliver_now
    if is_logged_in?
      log_out
      log_in(@user) # to make sure everything is loaded properly
    end
    redirect_to root_path, flash: { notice: I18n.t('msgs.account_activated', real_name: @user.real_name) }
  end
  
  def failed_validation
    session[:login_attempts] = session[:login_attempts].to_i + 1
    return redirect_to({ controller: 'users', action: 'login' }, flash: { error: I18n.t('msgs.sign_in_unsuccessful_error') })
  end
  
  def successful_validation
    log_in(@user)
    if params[:return_to].blank?
      return redirect_to({ controller: 'users', action: 'show', id: @user.id }, flash: { notice: I18n.t('msgs.sign_in_successful_notice') })
    else
      return redirect_to params[:return_to], flash: { notice: I18n.t('msgs.sign_in_successful_notice') }
    end
  end
  
  def load_user
    @user = User.find_by_id(params[:id])
    return redirect_to root_path unless @user
    @tab = params[:tab].nil? ? "profile" : params[:tab]
  end  
end