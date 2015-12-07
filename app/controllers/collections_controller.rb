class CollectionsController < ApplicationController
  
  def index
    
  end
  
  def show
    
  end
  
  def add_book
    if params[:title]
      col_id = Collection.create(title: params[:title], description: params[:description], is_public: params[:is_public], user_id: session[:user_id]).id
    else
      col_id = params[:col_id]
    end
    CollectionVolume.create(volume_id: params[:job_id], collection_id: col_id)
    flash[:notice] = I18n.t('msgs.book_added_to_collection')
    respond_to do |format|  
      format.html { render partial: 'layouts/flash' }
    end
  end
  
  def load
    collections = Collection.where(user_id: session[:user_id])
    disabled = []
    collections.each do |col|
      found = CollectionVolume.where(volume_id: params[:job_id], collection_id: col.id)
      if found.count > 0
        disabled << 1
      else
        disabled << 0
      end
    end
    respond_to do |format|  
      format.html { render partial: "books/add_book_to_collection", locals: { job_id: params[:job_id], collections: collections, disabled: disabled } }
    end
  end
end
