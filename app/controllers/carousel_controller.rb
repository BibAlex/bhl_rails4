class CarouselController < ApplicationController
  
  include CarouselHelper
before_filter :clean_params
  def get_carousel
    if params[:type] == "collections"
      carousel_options = load_collections_carousel(params)
    elsif params[:type] == "alsoviewed"
      carousel_options = load_alsoviewed_carousel(params)
    elsif params[:type] == "related"
      carousel_options = load_related_books_carousel(params)
    end
    respond_to do |format|
      format.html { render partial: "carousel/items", locals: carousel_options }
    end
  end
  
end
