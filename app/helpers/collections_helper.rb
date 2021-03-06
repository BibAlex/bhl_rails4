module CollectionsHelper
  include UsersHelper  
  
  def authenticate_user(user_id)
    if !is_logged_in?
      redirect_to controller: :users, action: :login and return false
    elsif !is_logged_in_user?(user_id)
      flash.now[:error] = I18n.t('msgs.access_denied_error')
      flash.keep
      redirect_to controller: :collections, action: :index and return false
    else
      true
    end
  end
end
