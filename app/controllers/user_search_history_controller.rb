class UserSearchHistoryController < ApplicationController
  before_filter :check_authentication, only: :save_query
  
  def save_query
    query = Query.create(user_id: session[:user_id].to_i, string: params[:query])
    flash[:notice] = I18n.t('common.entity_saved', entity: I18n.t('common.search_query'))
    respond_to do |format|  
     format.html { render partial: 'layouts/flash' }
    end
  end
  
end
