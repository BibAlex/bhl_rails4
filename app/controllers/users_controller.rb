class UsersController < ApplicationController

  include UsersHelper
  include BHL::Login

  before_filter :redirect_to_user_show_if_logged_in, only: [:login]
  before_filter :load_user, only: [:show]

  def login
    session[:login_attempts] ||= 0
    @verify_captcha = true if (session[:login_attempts].to_i  >= LOGIN_ATTEMPTS)
  end

  def logout
    if(params[:id].to_i == session[:user_id].to_i)
      log_out
      redirect_to root_path
    else
      unauthorized_action
    end
  end

  #GET /users/forgot_password
  def forgot_password
    redirect_to user_path(id: session[:user_id]) if is_logged_in?
    @page_title = I18n.t('common.forgot_password')
  end

  # POST /users/recover_password
  def recover_password
    return redirect_to user_path(id: session[:user_id]) if is_logged_in?
    if bhl_verify_recaptcha
      @email_format_re = /\A(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})\z/i
      if params[:user][:email] =~ @email_format_re
        @user = User.find_by_email(params[:user][:email])# unless @email
        if @user
          @user.change_activation_code
          send_reset_password_email
          redirect_to login_users_path, flash: { notice: I18n.t('msgs.recover_password_success') }
        else
          redirect_to forgot_password_users_path, flash: { error: I18n.t('msgs.email_not_found', email: @email) }
        end
      else
        redirect_to forgot_password_users_path, flash: { error: I18n.t('msgs.recaptcha_error') }
      end
    else
      redirect_to forgot_password_users_path, flash: { error: I18n.t('msgs.invalid_email_format') }
    end
  end

  def reset_password
    return redirect_to user_path(id: session[:user_id]) if is_logged_in?
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])
    if @user
      @page_title = I18n.t('common.reset_password')
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
    if(params[:user])
      if (session[:login_attempts].to_i >= LOGIN_ATTEMPTS) && !(bhl_verify_recaptcha)
        redirect_to({ controller: 'users', action: 'login'} , flash: { error: I18n.t('msgs.recaptcha_error') })
      else
        @user = User.find_by_username_and_password(params[:user][:username], User.hash_password(params[:user][:password]))
        if @user.nil?
          failed_validation(false)
        elsif !@user.active
          failed_validation(true)
        else
         successful_validation
        end
      end
    end
  end


  def new
    if(session[:user_id])
      redirect_to user_path(id: session[:user_id])
    else
      if session[:failed_user]
        @user = User.new(User.user_params(session[:failed_user]))
        @user.valid?
        @user.errors.add('recaptcha', I18n.t('msgs.form_validation_errors_for_attribute_assistive')) unless bhl_verify_recaptcha
        session[:failed_user] = nil
      else
         @user = User.new
      end
      @verify_captcha = true
    end
  end

  def create
    params[:user][:photo_name] = User.process_user_photo_name(params[:user][:photo_name])
    @user = User.new(User.user_params(params[:user]))
    if @user.valid? && bhl_verify_recaptcha
      handle_successful_registration
    else
      handle_failed_registration
    end
  end

  # GET /users/activate/:guid/:activation_code
  def activate
    @user = User.find_by_guid(params[:guid])
    return redirect_to root_path, flash: { error: I18n.t('msgs.activation_failed') } if @user.nil?
    unless @user.active
       return activate_user if @user.verification_code == params[:activation_code]
       return redirect_to root_path, flash: { error: I18n.t('msgs.activation_failed') }
    else
      redirect_to root_path, flash: { error: I18n.t('msgs.account_already_active') }
    end
  end

  def show
    if params[:tab] == "annotations"
      @tab = "annotations"
    elsif params[:tab] == "queries"
      @tab = "queries"
    elsif params[:tab] == "collections"
      @tab = "collections"
    elsif params[:tab] == "history"
      @tab = "history"
    elsif params[:tab] == "activity"
      @tab = "activity"
    else
      @tab = "profile"
    end
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

  def edit
    if authenticate_user(params[:id])
      @page_title = I18n.t('common.modify_profile')
      @action = "modify"
      @verify_captcha = false
      @user = User.find_by_id(params[:id])
      @user.email_confirmation = @user.email
    end
  end

  def update
    if authenticate_user(params[:id])
      @user = User.find(params[:id])
      user_attr = params[:user]
      params[:user][:photo_name] = User.process_user_photo_name(user_attr[:photo_name])

      if handle_change_password(user_attr)
        if @user.update_attributes(User.user_params(user_attr))
          handle_successful_update
        else
          handle_unsuccessful_update
        end
      end
    end
  end


  private

  def handle_successful_registration
    @user.save
    send_registration_confirmation_email
    redirect_to root_path, flash: { notice: I18n.t('msgs.registration_welcome_message', real_name: @user.real_name) }
  end

  def handle_failed_registration
    session[:failed_user] = params[:user]
    redirect_to controller: "users", action: "new"
  end

  def send_registration_confirmation_email
    port = request.port == 80 ? nil : ":#{request.port}"
    url = "#{request.host}#{port}/users/activate/#{@user.guid}/#{@user.verification_code}"
    Notifier.user_verification(@user, url).deliver_now
  end

  def send_reset_password_email
    port = request.port == 80 ? nil : ":#{request.port}"
    url = "#{request.host}#{port}/users/reset_password/#{@user.guid}/#{@user.verification_code}"
    Notifier.user_reset_password_verification(@user, url).deliver_now
  end

  def activate_user
    @user.activate
    Notifier.user_activated(@user).deliver_now
    if is_logged_in?
      log_out
      log_in(@user) # to make sure everything is loaded properly
    end
    redirect_to root_path, flash: { notice: I18n.t('msgs.account_activated', real_name: @user.real_name) }
  end

  def failed_validation(non_active)
    session[:login_attempts] = session[:login_attempts].to_i + 1
    error_msg = nil
    if non_active
      error_msg =  I18n.t('msgs.sign_in_inactive_user')
    else
      error_msg = I18n.t('msgs.sign_in_unsuccessful_error')
    end
    return redirect_to({ controller: 'users', action: 'login' }, flash: { error: error_msg })
  end

  def successful_validation
    log_in(@user)
    if session[:return_to].blank?
      return redirect_to({ controller: 'users', action: 'show', id: @user.id }, flash: { notice: I18n.t('msgs.sign_in_successful_notice') })
    else
      return redirect_to(session.delete(:return_to)), flash: { notice: I18n.t('msgs.sign_in_successful_notice') }
    end
  end

  def load_user
    if params[:id]
      @user = User.find_by_id(params[:id])
      @page_title = @user.username
      return redirect_to root_path , flash: {error: I18n.t('msgs.user_not_found')} unless @user
      @tab = params[:tab].nil? ? "profile" : params[:tab]
    else
      redirect_to root_path
    end
  end

  def load_queries_tab
    if authenticate_user(params[:id])
      @page_title = @user.username + " - " + I18n.t("common.queries")
      @page = params[:page] ? params[:page].to_i : 1
      @queries = @user.queries.order("created_at DESC").paginate(page: @page, per_page:  PAGE_SIZE)
    end
  end

  def load_activity_tab
     @page_title = @user.username + " - " + I18n.t("common.activity_log")
     @total_activities = Activity.where(user_id: params[:id]).count
     @page = params[:page] ? params[:page].to_i : 1
     limit = PAGE_SIZE
     @offset = (@page > 1) ? (@page - 1) * limit : 0
     @activities = Activity.where(user_id: params[:id]).order("created_at DESC").limit(limit).offset(@offset).
                   paginate(page: @page, per_page:  PAGE_SIZE)
  end

  def load_history_tab
    if authenticate_user(params[:id])
      @page_title = @user.username + " - " + I18n.t("common.history")
      @total_number = UserVolumeHistory.history(@user).count
      @page = params[:page] ? params[:page].to_i : 1
      @history = UserVolumeHistory.history(@user).paginate(page: @page, per_page: PAGE_SIZE)

      if @history.length > 0
        @recently_viewed_volume = Volume.find_by_id((@history.first).volume)
      end

      if @history.blank? and @page > 1
        redirect_to user_path(id: session[:user_id], tab: "history", page: params[:page].to_i - 1)
      end

      @url_params = params.clone
    end
  end

  def load_collections_tab
    @page_title = @user.username + " - " + I18n.t("common.collections")
    @page = params[:page] ? params[:page].to_i : 1
    if is_logged_in_user?(params[:id].to_i)
      user_collections = Collection.user_collections(session[:user_id])
      @total_number = user_collections.count
      @collections = user_collections.paginate(page: @page, per_page: PAGE_SIZE)
    else
      user_collections = Collection.public_user_collections(params[:id])
      @total_number = user_collections.count
      @collections = user_collections.paginate(page: @page, per_page: PAGE_SIZE)
    end
     if @collections.blank? and @page > 1
       redirect_to user_path(id: session[:user_id], tab: "collections", page: params[:page].to_i - 1)
      end
    @url_params = params.clone
  end

  def load_annotations_tab
    if authenticate_user(params[:id])
      @page_title = @user.username + " - " + I18n.t("common.annotations")
      @page = params[:page] ? params[:page].to_i : 1
      @total_number = Annotation.where("user_id = #{@user.id}").count
      @annotations = Annotation.where(user_id: @user).select(:volume_id).
       group(:volume_id).paginate(page: @page, per_page: TAB_GALLERY_PAGE_SIZE)
      @collected_annotations = []
      @annotations.each do |annotation|
        job_id = annotation.volume_id
        @collected_annotations << {
          job_id: job_id,
          book_title:  BooksHelper.find_field_in_document(job_id, :title).first,
          notes: Annotation.notes.where(user_id: @user.id, volume_id: job_id),
          highlights: Annotation.highlights.where(user_id: @user.id, volume_id: job_id)
        }
      end
    end
  end

  def handle_successful_update
    log_out
    log_in(@user) # to make sure everything is loaded properly
    flash.now[:notice] = I18n.t("msgs.changes_saved")
    flash.keep
    return redirect_to controller: "users", action: "show", id: params[:id]
  end

  def handle_unsuccessful_update
    flash.keep
    params[:entered_password] = nil
    params[:password_confirmation] = nil
    @user.email_confirmation = @user.email
    @action = "modify"
    render action: "edit"
    return
  end

  def handle_change_password(user_attr)
    if(!(user_attr[:entered_password].blank?) || !(user_attr[:password_confirmation].blank?))
        return old_password_required if user_attr[:old_password].blank?
    end

    if(!(user_attr[:old_password].blank?))
      return invalid_old_password if(!User.authenticate(user_attr[:username],user_attr[:old_password]))
    end
    return true
  end

  def old_password_required
    flash.now[:error] = I18n.t("msgs.old_password_required")
    render action: "edit"
    return false
  end

  def invalid_old_password
    flash.now[:error] = I18n.t("msgs.invalid_old_password")
    flash.keep
    @action = "modify"
    @user.email_confirmation = @user.email
    params[:entered_password] = nil
    params[:password_confirmation] = nil
    render action: "edit"
    return false
  end

end