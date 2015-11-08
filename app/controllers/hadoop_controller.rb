class HadoopController < ApplicationController
  include HadoopHelper
  require 'nokogiri'
  require 'uri'

  def pending_metadata
    #failed_books = Book.find_all_by_status_code("10")
    pending_metadata_books = Book.get_pending_metadata_books
    json_output = "{\"Books\":["
    pending_metadata_books.each do |b|
      json_output << "\"#{b.bib_id}\","
    end
    json_output = json_output[0...json_output.length-1] if pending_metadata_books.count > 0
    json_output << "]}"

    render json: json_output
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
end
