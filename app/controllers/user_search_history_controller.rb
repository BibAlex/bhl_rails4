class UserSearchHistoryController < ApplicationController
  include UsersHelper 
  
  before_filter :check_authentication, only:[:save_query, :delete_query]
  
  def save_query
       query = Query.create(user_id: session[:user_id].to_i, string: params[:query])
       flash[:notice] = I18n.t('common.entity_saved', entity: I18n.t('common.search_query'))
       respond_to do |format|  
        format.html { render partial: 'layouts/flash' }
       end
  end
  
  def delete_query
    if authenticate_user(params[:user_id].to_i)
      query = Query.find_by_id(params[:id])
      query.destroy
      redirect_to user_path( id: params[:user_id], tab: "queries"), flash: {notice: I18n.t('common.entity_deleted', entity: I18n.t('common.search_query'))}
    end 
  end
  
  def remove_book_history
    user_id = params[:user_id].to_i
    if authenticate_user(user_id)
      UserVolumeHistory.destroy(params[:user_volume_history_id])
      redirect_to user_path(id: user_id, tab: "history", page: params[:page]), flash: { notice: I18n.t('msgs.book_removed') }
    end
  end 
  
end
