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
  
  def forgot_password
    
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
  
  def load_activity_tab
     @total_activities = Activity.where(user_id: params[:id]).count
     @page = params[:page] ? params[:page].to_i : 1
     limit = PAGE_SIZE
     @offset = (@page > 1) ? (@page - 1) * limit : 0
     @activities = Activity.where(user_id: params[:id]).order("created_at DESC").limit(limit).offset(@offset).
                   paginate(page: @page, per_page:  PAGE_SIZE)
  end
end