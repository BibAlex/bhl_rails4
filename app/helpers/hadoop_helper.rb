module HadoopHelper

  def generate_json_book_listing(book_list)
    json_output = "{\"Books\":["
    book_list.each do |b|
      json_output << "\"#{b.bib_id}\","
    end
    json_output = json_output[0...json_output.length-1] if book_list.count > 0
    json_output << "]}"

    json_output
  end

  def ingest_metadata_from_xml_string(xml_content)
    begin
      mods_xml = Nokogiri::XML(xml_content)
    rescue
      return false
    end

    mods_xml.xpath("//BHLMeta//BIBID").each do |book_xml|
      bib_id = book_xml.attr("value").gsub("DAF-BHL:","")
      
      
     metadata_hash = process_mods(book_xml.xpath(".//mods").text)
     valid_book = false
     metadata_hash[:languages].each do |language|
        if ["eng", "fre", "ara", "ger", "ita"].include?(language.code) 
          valid_book = true
        end
      end
      
      
      # if valid_book
              
        book = Book.find_or_create_by(bib_id: bib_id)
  
        if book_xml.xpath(".//mods").count == 0
          # this means that this book has failed
          book.book_status_id = BookStatus.pending_metadata.id
          book.save
        else
          book.bibtex = book_xml.xpath(".//BIBTex").text
          book.endnote = book_xml.xpath(".//EndNote").text
          book.mods = book_xml.xpath(".//mods").text               
  
          if metadata_hash[:title_alternative].blank? &&  metadata_hash[:title].blank?
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
          # # metadata_hash[:languages].each do |language|
            # # if ["eng", "fre", "ara", "ger", "ita"].include?(language.code) 
              # # book.languages << language    
            # # end
          # end
          
          book.subjects << metadata_hash[:subjects]
  
          book_xml.xpath(".//JobIDs//JobID").each do |job_id|
            book.volumes << Volume.find_or_create_by(job_id: job_id.text.gsub("DAF-Job:",""))
          end
          book.save
        end
      # end
    end
    return true
  end

  def process_mods(mods_string)
    # this function should return a hash with extracted metadata from mods
    mods_xml = Nokogiri::XML(mods_string)
    mods_hash = {}
    begin
      # check the title, is it title or alternative?
      mods_xml.xpath('//xmlns:titleInfo').each do |titleInfo|
         if titleInfo.attr('type') == 'alternative'
           mods_hash[:title_alternative] = get_title(titleInfo)
         else
           mods_hash[:title] = get_title(titleInfo)
         end
      end
    rescue
      # this means that there is something wrong with the file?
      return mods_hash
    end

    mods_hash[:authors] = get_authors(mods_xml.xpath('//xmlns:name'))
    mods_hash[:published_at] = mods_xml.xpath('//xmlns:originInfo/xmlns:dateIssued').text unless mods_xml.xpath('//xmlns:originInfo/xmlns:dateIssued').empty?
    mods_hash[:publisher] = mods_xml.xpath('//xmlns:originInfo/xmlns:publisher').text unless mods_xml.xpath('//xmlns:originInfo/xmlns:publisher').text.empty?
    mods_hash[:note] = mods_xml.xpath('//xmlns:note').text unless mods_xml.xpath('//xmlns:note').text.empty?
    mods_hash[:edition] = mods_xml.xpath('//xmlns:originInfo/xmlns:edition').text unless mods_xml.xpath('//xmlns:originInfo/xmlns:edition').text.empty?
    mods_hash[:locations] = get_locations(mods_xml.xpath('//xmlns:originInfo/xmlns:place'))
    mods_hash[:subjects] = get_subjects(mods_xml.xpath('//xmlns:subject'))
    mods_hash[:languages] = get_languages(mods_xml.xpath('//xmlns:language'))

    return mods_hash
  end

private

  def get_title(title_info)
    title = []
    title << title_info.xpath(".//xmlns:nonSort").text unless title_info.xpath(".//xmlns:nonSort").text.empty?
    title << title_info.xpath(".//xmlns:title").text unless title_info.xpath(".//xmlns:title").text.empty?
    title << title_info.xpath(".//xmlns:subTitle").text unless title_info.xpath(".//xmlns:subTitle").text.empty?
    title << title_info.xpath(".//xmlns:partNumber").text unless title_info.xpath(".//xmlns:partNumber").text.empty?
    title << title_info.xpath(".//xmlns:partName").text unless title_info.xpath(".//xmlns:partName") .text.empty?
    return title.join(' ')
  end

  def get_author_name(name)
    name_string = []
    name.xpath('.//xmlns:namePart').each do |name_part|
      name_string << name_part.text
    end
    return name_string.join(', ')
  end

  def get_authors(names_xml)
    authors = []
    names_xml.each do |name|
      if name.attr('type') == 'personal'
        author_name = get_author_name(name)
        authors << Author.find_or_create_by(name: author_name) unless author_name.empty?
      end
    end
    authors
  end

  def get_locations(locations_xml)
    locations = []
    locations_xml.each do |place|
      if place.xpath('.//xmlns:placeTerm').attr('type').to_s == 'text'
        loc = place.xpath('.//xmlns:placeTerm').text
        locations << Location.find_or_create_by(formatted_address: loc) unless loc.empty?
      end
    end
    locations
  end

  def get_subjects(subjects_xml)
    subjects = []
    subjects_xml.each do |subject|
      subject.children.each do |child_node|
        subjects << Subject.find_or_create_by(name: child_node.text) unless child_node.text.empty?
      end
    end
    subjects
  end

  def get_languages(language_xml)
    languages = []
    language_xml.xpath('.//xmlns:languageTerm').each do |lang|
      if ["eng", "fre", "ara", "ger", "ita"].include?(lang.text)
        languages << Language.find_or_create_by(code: lang.text) unless lang.text.empty?
      end      
    end
    languages
  end
end
