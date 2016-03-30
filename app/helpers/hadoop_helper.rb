require 'json'
require 'tempfile'

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
  
  def generate_json_volume_pending_content_listing(volume_list)    
    if volume_list.blank?
      batch_id = ""
      json_output = "{ \"batch_id\": \"#{batch_id}\", \"Volumes\":["
    else
      batch_id = Batch.create(status_id: BatchStatus.pending_content.id).id
      json_output = "{ \"batch_id\": \"#{batch_id}\", \"Volumes\":["
      volume_list.each do |volume|
        volume.update_attributes(status_id: VolumeStatus.pending_content.id, number_of_trials: volume.number_of_trials + 1, batch_id: batch_id)
        json_output << "\"#{volume.job_id}\","        
      end
      json_output = json_output[0...json_output.length-1] 
    end
    json_output << "]}"
    json_output
  end
  
  def generate_json_volume_pending_indexing_listing(batch_id_param)
    if batch_id_param.nil?
      batch = Batch.where(status_id: BatchStatus.pending_indexing.id)
      batch_id = batch.empty? ? "" : batch.first.id
    else
      batch = Batch.find(batch_id_param)
      batch_id = batch.id if batch
    end
    pending_volumes  = Volume.where("batch_id = ? AND status_id = ? ",batch_id, VolumeStatus.pending_indexing)
    json_output = "{ \"batchID\": \"#{batch_id}\", \"books\":["
    pending_volumes.each do |volume|
      book = Book.find(volume.book_id)
      languages = []
      authors = []
      subjects = []
      locations = []
      book.languages.select(:name).each do |lang|
        languages << "#{lang.name}"
      end
      book.authors.select(:name).each do |author|
        authors << "#{author.name}"
      end
      book.subjects.select(:name).each do |subject|
        subjects << "#{subject.name}"
      end
      book.locations.select(:address).each do |location|
        locations << "#{location.address}"
      end
      json_output << "{\"job_id\": #{volume.job_id.to_json},"
      json_output << "\"bibID\": #{book.bib_id.to_json},"
      json_output << "\"date\": #{book.published_at.to_json},"
      json_output << "\"languages\": #{languages},"
      json_output << "\"titles\": [#{book.title.to_json},#{book.title_alternative.to_json}],"
      json_output << "\"authors\": #{authors},"
      json_output << "\"subjects\": #{subjects},"
      json_output << "\"publishers\": [#{book.publisher.to_json}],"
      json_output << "\"location_address\": #{locations},"
      json_output << "\"main_title\": #{book.title.to_json}},"
    end
    json_output = json_output[0...json_output.length-1] if pending_volumes.count > 0
    json_output << "]}"

    json_output
  end
  
  def generate_json_location_listing(locations_list)
    json_output = "{\"Locations\":["
    locations_list.each do |location|
      json_output << "\"#{location.address}\","
    end
    json_output = json_output[0...json_output.length-1] if locations_list.count > 0
    json_output << "]}"
    json_output
  end
  
  def ingest_locations_from_xml_string(xml_content)
    begin
      mods_xml = Nokogiri::XML(xml_content)
    rescue
      return false
    end
    
    mods_xml.xpath("//Geolocations//Location").each do |location_xml|
      address = location_xml.xpath(".//address").text
      location = Location.find_or_create_by(address: address)
      country = Country.find_or_create_by(name: location_xml.xpath(".//country").text)
      location.country_id = country.id
      location.latitude = location_xml.xpath(".//latitude").text.to_f
      location.longitude = location_xml.xpath(".//longitude").text.to_f
      location.formatted_address = location_xml.xpath(".//formattedAddress").text.to_f      
      location.save
    end
    
    return true
  end
  
  def mark_finished_indexing(xml_content)
    begin
      data_xml = Nokogiri::XML(xml_content)
    rescue
      return false
    end    
    
    data_xml.xpath("//IndexingFailureList").each do |batch|
      batch_id = batch.attr("batchID").to_i
      Batch.find(batch_id).update_attributes(status_id: BatchStatus.indexed.id)
      failure_list = []
      data_xml.xpath("//IndexingFailureList//JobID").each do |job_id|
        failure_list << job_id
      end
      
      Volume.where("batch_id = ? AND status_id = ? ", batch_id, VolumeStatus.pending_indexing.id).each do |volume|
        if failure_list.include?(volume.job_id)
          volume.update_attributes(status_id: nil, batch_id: nil)
        else
          volume.update_attributes(status_id: VolumeStatus.indexed.id)
        end
      end      
    end
    return true
  end
  
  
  def mark_finished_content_volumes(xml_content)
    begin
      data_xml = Nokogiri::XML(xml_content)
    rescue
      return false
    end
    
    data_xml.xpath("//ContentSuccessList").each do |batch|
      data_xml.xpath("//ContentSuccessList//JobID").each do |job_id|
        volume = Volume.find_by_job_id(job_id.text.to_i)
        volume.update_attributes(status_id: VolumeStatus.pending_indexing.id) if volume
      end      
    end
    return true
  end
  
  def ingest_batch(batch_id, names_content)
    batch = Batch.find(batch_id)
    batch.update_attributes(status_id: BatchStatus.pending_indexing.id) unless Volume.where(batch_id: batch.id).blank?
    volumes = Volume.where("batch_id = ? AND status_id = ? ",batch.id, VolumeStatus.pending_content.id)
    unless volumes.blank?
      volumes.each do |vol|
        volume.update_attributes(status_id: nil, batch_id: nil)
      end
    end
    begin
      file = File.new("#{Rails.root}/public/batches_#{Rails.env}/batch_#{batch_id}.zip", 'wb+')
      file.binmode
      file.write(names_content)
      file.flush
    rescue
      return false
    end
    return true
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
          book.book_status_id = BookStatus.finished_metadata.id
          book.save
          
          book.authors << metadata_hash[:authors]
          book.locations << metadata_hash[:locations]
          book.languages << metadata_hash[:languages]          
          book.subjects << metadata_hash[:subjects]
  
          book_xml.xpath(".//JobIDs//JobID").each do |job_id|
            volume = Volume.find_or_create_by(job_id: job_id.text.gsub("DAF-Job:",""))
            book.volumes << volume
          end
          book.save
        end
       
      end
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
      name_string << name_part.text unless name_part.text.empty?
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
        locations << Location.find_or_create_by(address: loc) unless loc.empty?
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
        languages << Language.find_or_create_by(code: lang.text) unless lang.text.empty?
    end
    languages
  end
end
