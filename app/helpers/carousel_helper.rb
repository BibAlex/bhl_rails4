module CarouselHelper

  include BooksHelper
  include SolrHelper

  def load_collections_carousel(params)
    items = Collection.includes(:collection_volumes)
                      .where(collection_volumes: { volume_id: params[:job_id] })
                      .where("is_public=true")
                      .paginate(page: params[:page], per_page: LIMIT_CAROUSEL)
    options = { items: items, carousel_title: I18n.t('common.collections'), controller: "collections", action: "show", type: params[:type], object_id: params[:job_id] }
  end

  def load_alsoviewed_carousel(params)
    volume = Volume.find_by_job_id(params[:job_id])
    items = WillPaginate::Collection.create(params[:page], LIMIT_CAROUSEL, volume.volume_views_count) do |pager|
      pager.replace volume.volume_views(params[:page])
    end
    options =  { items: items, carousel_title: I18n.t('common.user_viewed'), controller: "books", action: "show", type: params[:type], object_id: params[:job_id] }
  end

  def load_related_books_carousel(params)
    byebug
    result = get_related_books(params)
    items = WillPaginate::Collection.create(params[:page], LIMIT_CAROUSEL, result[:total_number_of_volumes]) do |pager|
      pager.replace result[:volumes]
    end
    options = { items: items, carousel_title: I18n.t('common.related_books'), controller: "books", action: "show", type: params[:type], object_id: params[:job_id] }
  end

end
