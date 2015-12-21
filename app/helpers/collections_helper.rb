module CollectionsHelper
  include UsersHelper  
  
  def authenticate_user(user_id)
    if !is_logged_in?
      redirect_to controller: :users, action: :login
    elsif !is_logged_in_user?(user_id)
      flash.now[:error] = I18n.t('msgs.access_denied_error')
      flash.keep
      redirect_to controller: :collections, action: :index
    else
      true
    end
  end
end
