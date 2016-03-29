class UserSearchHistoryController < ApplicationController
  include UsersHelper 
  
  before_filter :check_authentication
  
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
    if(params[:id])
      query = Query.find_by_id(params[:id])
      if query
        if session[:user_id] == query.user_id
          query.destroy
          return redirect_to user_path( id: session[:user_id], tab: "queries"), flash: {notice: I18n.t('common.entity_deleted', entity: I18n.t('common.search_query'))}
        else
          return unauthorized_action
        end
      end
    end
    return redirect_to root_path, flash: {notice: I18n.t('warn.can_not_find_query')}
  end
  
  def remove_book_history
    volume_history =  UserVolumeHistory.find_by_id(params[:user_volume_history_id])
    if volume_history
      if volume_history.user_id == session[:user_id]
        volume_history.destroy
        return redirect_to user_path(id: session[:user_id], tab: "history", page: params[:page]), flash: { notice: I18n.t('msgs.book_removed') }
      else
        return unauthorized_action
      end
    else
      resource_not_found
    end
  end 
  
end
