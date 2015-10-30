class HadoopController < ApplicationController
  include HadoopHelper
  require 'nokogiri'
  require 'uri'

  def pending_metadata
    #failed_books = Book.find_all_by_status_code("10")
    pending_metadata_books = Book.get_pending_metadata_books
    @json = "{\"Books\":["
    pending_metadata_books.each do |b|
      @json << "\"#{b.bib_id}\","
    end
    @json = @json[0...@json.length-1] if pending_metadata_books.count > 0
    @json << "]}"

    render json: @json
  end

  def ingest_metadata
    # this xml file should be POSTED in this request
    xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "metadata_sample.xml"))
    mods_xml = Nokogiri::XML(xml_file_path)
    xml_file_path.close

    mods_xml.xpath("//BHLMeta//BIBID").each do |book_xml|
      bib_id = book_xml.attr("value").gsub("DAF-BHL:","")

      book = Book.find_or_create_by(bib_id: bib_id)

      if book_xml.xpath(".//mods").count == 0
        # this means that this book has failed
        book.book_status_id = BookStatus.pending_metadata.id
        book.save
      else
        book.bibtex = book_xml.xpath(".//BIBTex").text
        book.endnote = book_xml.xpath(".//EndNote").text
        book.mods = book_xml.xpath(".//mods").text

        metadata_hash = process_mods(book_xml.xpath(".//mods").text)

        if metadata_hash[:title_alternative].nil? &&  metadata_hash[:title].nil?
          # this means that this book has failed
          book.book_status_id = BookStatus.pending_metadata.id
          book.save
        else
          book.title = metadata_hash[:title]
          book.title_alternative = metadata_hash[:title_alternative]
          book.published_at = metadata_hash[:published_at]
          book.publisher = metadata_hash[:publisher]
          book.contributor = metadata_hash[:contributor]

          book.book_status_id = BookStatus.pending_content.id
          book.save
        end

        book.authors << metadata_hash[:authors]
        book.locations << metadata_hash[:locations]
        book.languages << metadata_hash[:languages]
        book.subjects << metadata_hash[:subjects]

        book.save
      end
    end
    @mods_hash = mods_xml.xpath("//BHLMeta//BIBID").count
  end
end
