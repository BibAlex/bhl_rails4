class CollectionsController < ApplicationController
  include CollectionsHelper
  include BooksHelper
  before_filter :store_location, only: [:show]
  before_filter :check_authentication, only: [:add_book]

  def index
    @page_title = I18n.t('collection.collection_title')
    @page = params[:page] ? params[:page].to_i : 1

    sql_query = "is_public = 1"
    sql_query += " AND title LIKE '%#{params[:search]}%'" unless params[:search].blank?
    @collections = Collection.where(sql_query).paginate(page: @page, per_page: PAGE_SIZE).order(params[:sort_type])
    @collections_total_number = Collection.where(sql_query).count
  end

  def autocomplete
    @results = Collection.where("title LIKE :title", { title: "#{params[:term]}%" }).group(:title).limit(10).map(&:title) # TODO put it in config
    render json: @results
  end

  def show
    @collection = Collection.find(params[:id])
    @page_title = @collection.title
    @page_author = User.find(@collection.user_id).username
    if @collection.is_public || authenticate_user(@collection.user_id)
      @collection_id = params[:id]
      @user_rate = Rate.load_user_rate(session[:user_id], @collection_id, "collection") || 0.0
      @view = params[:view] ? params[:view] : 'list'
      @page = params[:page] ? params[:page].to_i : 1
      @collection_volumes = @collection.collection_volumes.paginate(page: @page, per_page: PAGE_SIZE).order('position ASC')
      @user = User.find(@collection.user_id)
      @url_params = params.clone
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    @page_title = "#{@collection.title} -  #{I18n.t('collection.edit_collection_page_title')}"
    @page_author = User.find(@collection.user_id).username
    authenticate_user(@collection.user_id)
  end

  def update
    @collection = Collection.find(params[:id])
    if authenticate_user(@collection.user_id) && request.env["HTTP_REFERER"].present? &&
      request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      params[:collection][:photo_name] = Collection.process_collection_photo_name(params[:collection][:photo_name]) if !params[:collection][:photo_name].blank?
      if @collection.update_attributes(Collection.collection_params(params[:collection]))
        flash.now[:notice]=I18n.t('collection.collection_updated')
        flash.keep
        redirect_to controller: :collections, action: :show
        return
      else
        flash.now[:error] = I18n.t('collection.collection_not_updated')
        flash.keep
        render action: :edit
        return
      end
    end
  end

  def move_up
    move_or_delete_book("up")
  end

  def move_down
    move_or_delete_book("down")
  end

  def delete_book
    move_or_delete_book("delete")
  end

  def get_or_delete_collection_photo
    @collection = Collection.find(params[:id])
    if (is_logged_in_user?(@collection.user_id) && params[:is_delete].to_i == 1)
      @collection.update_attributes(photo_name: '')
      @collection.delete_photo
      @collection.reload
    end
    respond_to do |format|
      format.html {render :partial => "collections/get_collection_photo"}
    end
  end

  def remove_collection
    collection = Collection.find_by_id(params[:id])
    if collection
      if is_logged_in_user?(collection.user_id)
        collection.delete
        Rate.user_collection_rates(collection.user_id).delete_all
        Comment.collection_comments.delete_all
        flash[:notice]=I18n.t('collection.collection_removed')
        flash.keep
        redirect_to_back_or_default(user_path(id: session[:user_id], tab: "collections"))
      else
        unauthorized_action
      end
    else
      resource_not_found
    end
  end

  def add_book
    if Volume.find_by_job_id(params[:job_id])
      if params[:title]
        col = Collection.new(title: params[:title], description: params[:description], is_public: params[:is_public], user_id: session[:user_id])
        if col.valid?
          col.save
          col_id = col.id
        else
          flash[:notice] = col.errors.full_messages
          respond_to do |format|
            format.html { render partial: 'layouts/flash' }
          end
        end
      else
        col_id = params[:col_id]
      end
      add_book_to_collection(params[:job_id], col_id) if col_id
    else
      resource_not_found
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

  private

  def move_or_delete_book(decision)
    collection_volume = CollectionVolume.find(params[:collection_volume_id])
    collection = Collection.find(collection_volume.collection_id)
    if authenticate_user(collection.user_id)
      if decision == "up"
        collection_volume.move_higher
      elsif decision == "down"
        collection_volume.move_lower
      else
        collection_volume.destroy
        flash.now[:notice] = I18n.t('collection.collection_volume_deleted')
        flash.keep
      end
      collection.update_attributes(updated_at: Time.now)
      redirect_to_back_or_default(collections_path)
    end
  end

  def add_book_to_collection(job_id, col_id)
    if collection = Collection.find_by_id(col_id)
      if is_logged_in_user?(collection.user_id)
        unless CollectionVolume.find_by_volume_id_and_collection_id(job_id, col_id)
          CollectionVolume.create(volume_id: job_id, collection_id: col_id)
          flash[:notice] = I18n.t('msgs.book_added_to_collection')
        else
          flash[:notice] = I18n.t('msgs.book_already_added')
        end
        respond_to do |format|
          format.html { render partial: 'layouts/flash' }
        end
      else
        unauthorized_action
      end
    else
      resource_not_found
    end
  end
end
