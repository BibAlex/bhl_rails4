module UsersHelper
  include ApplicationHelper
  
  def is_logged_in?
    session[:user_id].nil? ? false : true
  end
  
  def get_user_form_params(user)
    if user.new_record?
      { page_title: I18n.t('common.signup'), verify_captcha: true }
    else
      { page_title: I18n.t('common.modify_profile'), verify_captcha: false }
    end
  end
  
  def get_tab_class(tab, current_tab)
    tab == current_tab ? "active" : ""
  end

  def authenticate_user(user_id)
    redirect_to login_users_path and return false unless is_logged_in?
    redirect_to user_path(id: params[:id]), flash: {error: I18n.t('msgs.access_denied_error')} and return false unless session[:user_id].to_i == user_id.to_i
    return true
  end
end