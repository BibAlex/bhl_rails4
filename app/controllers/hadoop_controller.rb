class HadoopController < ApplicationController
  require 'nokogiri'
  require 'uri'

  def failedbibids

    failed_books = Book.find_all_by_status_code("10")
    @json = "{\"Books\" : [ "
    failed_books.each do |b|
      @json += "\"#{b.bib_id}\","
    end
    @json = @json[0...@json.length-1]
    @json += " ]}"
  end

  def metadata
    #TODO: Kamal Micheal. Edit code to grab XML from url as parameter ### Read Mods and JobIds
    #@xml = URI.decode(params[:xml])

    @xml = File.open("#{Rails.root}/public/sample.xml") #Sample to be provided by Mina
    doc = Nokogiri::XML(@xml)
    books = doc.xpath("//BIBID")
    
    books.each do |item|
      bibtex = item.xpath("BIBTex").text
      endnote = item.xpath("EndNote").text
      mods = Nokogiri::XML(item.xpath("mods").to_xml)
      bibid = item.attr("value")
    end
  end
end
