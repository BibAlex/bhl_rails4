module HadoopHelper
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
      languages << Language.find_or_create_by(code: lang.text) unless lang.text.empty?
    end
    languages
  end
end
