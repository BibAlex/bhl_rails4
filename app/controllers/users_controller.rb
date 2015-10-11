class UsersController < ApplicationController
  
  include UsersHelper
  
  def login
    
  end
  
  def logout
    
  end
  
  def new
    if session[:failed_user]
      @user = User.new(User.user_params(session[:failed_user]))
      @user.valid?
      session[:failed_user] = nil
    else
       @user = User.new
    end
  end
  
  def create
    @user = User.new(User.user_params(params[:user]))
    if @user.valid?
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
  
  def activate_user
    @user.activate
    # Notifier.user_activated(@user).deliver_now
    if is_logged_in?
      log_out
      log_in(@user) # to make sure everything is loaded properly
    end
    redirect_to root_path, flash: { notice: I18n.t('msgs.account_activated', real_name: @user.real_name) }
  end
end