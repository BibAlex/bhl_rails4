class HadoopController < ApplicationController
  include HadoopHelper
  require 'nokogiri'
  require 'uri'  

  def pending_metadata
    render json: generate_json_book_listing(Book.get_pending_metadata_books)
  end

  def ingest_metadata
    xml_content = request.body.read
    if xml_content.empty?
      render json: "Error invalid post"
      return
    end
    if ingest_metadata_from_xml_string(xml_content)
      render json: "Success"
    else
      render json: "Error invalid post"
      return
    end
  end

  def pending_content
    render json: generate_json_volume_pending_content_listing(Volume.get_pending_content_volumes)
  end
  
  def pending_indexing
    render json: generate_json_volume_pending_indexing_listing
  end
  
  def finished_indexing
    json_content = request.body.read
    if json_content.empty?
      render json: "Error invalid post"
      return
    end
    if mark_finished_indexing(json_content)
      render json: "Success"
    else
      render json: "Error invalid post"
      return
    end
  end
  
  def missing_locations
    render json: generate_json_location_listing(Location.get_missing_locations)
  end
  
  def ingest_locations
    xml_content = request.body.read
    if xml_content.empty?
      render json: "Error invalid post"
      return
    end
    if ingest_locations_from_xml_string(xml_content)
      render json: "Success"
    else
      render json: "Error invalid post"
      return
    end
  end
  
  def mark_finished_content
    xml_content = request.body.read
    if xml_content.empty?
      render json: "Error invalid post"
      return
    end
    if mark_finished_content_volumes(xml_content)
      render json: "Success"
    else
      render json: "Error invalid post"
      return
    end
  end
  
  def ingest_content
    if params[:batch_id].nil?
      render json: "Error invalid post"
      return
    end
    
    names_content = params[:body]
    if names_content.empty?
      render json: "Error invalid post"
      return
    end
     
    if ingest_batch(params[:batch_id], names_content)
      render json: "Success"
    else
      render json: "Error invalid post"
      return
    end
  end
end