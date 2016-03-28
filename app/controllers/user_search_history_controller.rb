class UserSearchHistoryController < ApplicationController
  include UsersHelper 
  
  before_filter :check_authentication, only:[:save_query, :delete_query]
  
  def save_query
    if params[:query]
      query = Query.create(user_id: session[:user_id].to_i, string: params[:query])
      flash[:notice] = I18n.t('common.entity_saved', entity: I18n.t('common.search_query'))
      respond_to do |format|  
        format.html { render partial: 'layouts/flash' }
      end
    else
      redirect_to books_path , flash: { notice: I18n.t('warn.empty_search_query_warn') }
    end
  end
  
  def delete_query
    # if authenticate_user(params[:user_id].to_i)
    if(params[:id])
      query = Query.find_by_id(params[:id])
      query.destroy
      redirect_to user_path( id: session[:user_id], tab: "queries"), flash: {notice: I18n.t('common.entity_deleted', entity: I18n.t('common.search_query'))}
    else
      redirect_to root_path, flash: {notice: I18n.t('warn.can_not_find_object', object: "walaa")}
    end
    # end 
  end
  
  def remove_book_history
    user_id = params[:user_id].to_i
    if authenticate_user(user_id)
      UserVolumeHistory.destroy(params[:user_volume_history_id])
      redirect_to user_path(id: user_id, tab: "history", page: params[:page]), flash: { notice: I18n.t('msgs.book_removed') }
    end
  end 
  
end
