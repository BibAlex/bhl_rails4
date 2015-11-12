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
    render json: generate_json_book_listing(Book.get_pending_content_books)
  end
end
