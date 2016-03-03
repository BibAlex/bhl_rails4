module BooksHelper
  def facet_list(response, field)
    list = []
    response.facets.each do |facet|
      if facet.name == field
        facet.items.each do |item|
          list << { :name => item.value, :count => item.hits } if (item.hits) > 0
        end
        break
      end
    end
    list
  end

  # TODO: not updated: will be updated after finishing books search function
  def add_facet_search(params, type, field)
    tmp_params = params.clone
    unless type =="sort_type"
      if tmp_params.has_key?("_#{type}".to_sym)
        tmp_params["_#{type}".to_sym] = field + " _OR " + tmp_params["_#{type}".to_sym]
      else
        tmp_params["_#{type}".to_sym] = field
      end
       tmp_params[:sort_type] = nil
    else
      tmp_params[:sort_type] = field
    end
    tmp_params[:controller] = tmp_params[:action] = tmp_params[:page] = tmp_params[:locale] = nil
    tmp_params
  end

  def search_volumes(query, page, limit, sort_type)
    response = search_facet_highlight(query, page, limit, sort_type)
    
    process_solr_volumes(response, query, page, limit)
  end

  def fill_response_array(arr)
    arr.slice 0, MAX_NAMES_PER_BOOK
  end

  def get_names_info(sci_names)
   sci_names_info = []
    sci_names.each do |sci_name|
      info = get_name_info(sci_name)
     sci_names_info <<  info unless info.nil?
    end
    sci_names_info
  end

  def name_tip (job_id, string, eol_thumb, eol_page_id)
    title_tip = ''
    if eol_thumb
      thumb = ATTACHMENTS_URL + THUMB_FOLDER + eol_thumb
      title_tip = "<div style='float:left'>
                    <img style='height:100px' src='#{thumb}'></img>
                   </div>"
    end
    title_tip += "<div style='float:left'>
                    <span >#{string}</span>
                    <ul>
                      <li><a href='../books/#{job_id}?tab=read'>
                        #{I18n.t('common.find_in_book')}
                      </a></li>"
    if eol_page_id != nil && eol_page_id > -1
      title_tip += "<li><a href='http://eol.org/pages/#{eol_page_id}'>
                          #{I18n.t('common.view_in_eol')}
                        </a></li>"
    end
    title_tip += "<li><a href='../books?_name=#{string}'>
                        #{I18n.t('common.books_with_name')}
                      </a></li>
                    </ul>
                  </div>"
    title_tip
  end

  def book_names_more_open_div(vol_jobid, sci_names_count)
    more_names = ''
    if sci_names_count > MAX_NAMES_PER_BOOK
      count =
      more_names = I18n.t('common.and_count_more', count: (sci_names_count - MAX_NAMES_PER_BOOK))
    end
    "<a href = '#' data-toggle='modal' data-target ='#morenamesdiv_#{vol_jobid}'>#{more_names}</a>".html_safe
  end

  def fill_query_array(params)
    search_params = params.select { |key, value| ["_title", "_subject", "_language", "_author", "_name", "_location", "_publisher", "_content", "_all"].include?(key) }
    query_array = { 'all' => [], 'title'=> [], 'language'=> [],
                    'location'=> [], 'author'=> [], 'name'=> [],
                    'subject'=> [], 'content' => [], 'publisher' => [] }
    query_array.each do  |key, value|
      query_array[key] = search_params["_#{key}"] ? search_params["_#{key}"].split(' _OR ') : []
    end
    query_array
  end


  def set_query_string(query_array, name_query_join_operator)
    emptyQuery = is_empty_search?(query_array)
    if(emptyQuery)
      query = "*:*"
    else
      multilingual_attributes = get_multilingual_attributes(query_array)
      normal_attributes = get_normal_attributes(query_array, name_query_join_operator)
      if(!(query_array['all'].empty?))
        query = prepare_search_query(multilingual_attributes, normal_attributes, "OR")
      else
        query = prepare_search_query(multilingual_attributes, normal_attributes, "AND")
      end
    end
    query
  end

  def is_empty_search?(query_array)
    emptyQuery = true
    query_array.each do |key, value|
      if value.count > 0
        emptyQuery = false
        break
      end
    end
    emptyQuery
  end

  def prepare_search_query(multilingual_attributes_and_values, normal_attributes_and_values, query_join_operator)
    attributes = []
    languages = ["en", "ge", "ar", "fr", "it", "ud"]
    multilingual_query = ''
    normal_query = ''

    unless multilingual_attributes_and_values.empty?
      multilingual_attributes_and_values.each do |key, value_arr|
        field_query = '('
        tmp_array = []
        value_arr.each do |item|
          tmp_array << "\"" + item + "\""
        end
        values = "(" + tmp_array.join(" OR ") + ")"
        languages.each do |language|
          field_query += field_query == '(' ? "#{key}_#{language}:#{values}" : " OR #{key}_#{language}:#{values}"
        end
        field_query += ")"
        multilingual_query += multilingual_query == '' ? field_query : " #{query_join_operator} #{field_query}"
      end
    end

    normal_attributes_and_values.each do |key, value_arr|
       field_query = '('
       tmp_array = []
       value_arr.each do |item|
         tmp_array << "\"" + item.to_s + "\""
       end
       values = "(" + tmp_array.join(" OR ") + ")"
       field_query = "(" + "#{key}:#{values}" + ")"
       normal_query += normal_query == '' ? field_query : " #{query_join_operator} #{field_query}"
    end

    if multilingual_query != '' && normal_query != ''
      query = multilingual_query + "#{query_join_operator}" + normal_query
    elsif multilingual_query != '' && normal_query == ''
      query = multilingual_query
    elsif multilingual_query == '' && normal_query != ''
      query = normal_query
    else
      query = ''
    end
  end

  def get_multilingual_attributes(query_array)
    multilingual_attributes = { }
    multilingual_attributes[:title] = query_array['title'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['title']
    multilingual_attributes[:author] = query_array['author'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['author']
    multilingual_attributes[:subject] = query_array['subject'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['subject']
    multilingual_attributes[:publisher] = query_array['publisher'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['publisher']
    multilingual_attributes[:content] = query_array['content'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['content']
    multilingual_attributes.delete_if { |key, value| value.blank? }
  end

  def get_normal_attributes(query_array, name_query_join_operator)
    normal_attributes = { }
    normal_attributes[:location_search] = query_array['location'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['location']
    normal_attributes[:language_facet] = query_array['language'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['language']
    sci_names = query_array['name'].empty? ? (query_array['all'].empty? ? nil : query_array['all']) : query_array['name']
    unless sci_names.nil?
      job_ids = get_volumes_contain_sci_name(sci_names, name_query_join_operator)
      normal_attributes[:job_id] = job_ids.empty? ? nil : job_ids
    end
    normal_attributes.delete_if { |key, value| value.blank? }
  end


  def remove_bread_crumb(params, type, field)
    tmp_params = params.clone
    if (tmp_params["_#{type}".to_sym].include?("#{field} _OR "))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub("#{field} _OR ", '')
    elsif (tmp_params["_#{type}".to_sym].include?(" _OR #{field}"))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub(" _OR #{field}", '')
    elsif (tmp_params["_#{type}".to_sym] == field)
      tmp_params.delete("_#{type}".to_sym)
    end
    tmp_params[:controller] = nil
    tmp_params[:action] = nil
    tmp_params[:page] = nil
    tmp_params[:sort_type] = nil
    tmp_params[:locale] = nil
    tmp_params
  end

  def parse_url_params(params)
    search_params = params.select { |key, value| ["_title", "_subject", "_language", "_author", "_name", "_location", "_publisher", "_content"].include?(key) }
    saved_query=''
    search_params.each do |key,value|
      saved_query += key + "=" + value +"&"
    end
    saved_query[0,saved_query.length-1]
  end


  def already_saved?(user_id, user_query)
   !(Query.where("user_id = ? and string = ?", user_id, user_query).empty?)
 end

 def item_count_format(type, item)
    format = item
    unless item_count(type, item).nil?
      format += ' (' + item_count(type, item).to_s + ')'
    end
    format
  end

  def get_format(id, format)
    if format == 'mods'
      handle_mods_format(id)
    else
      handle_other_formats(id, format)
    end
  end

  def self.find_field_in_document(job_id, field)
    languages = { "English" => "en", "German" => "ge", "Arabic" => "ar", "French" => "fr", "Italian" => "it" }
    doc = SolrHelper.solr_find_document("job_id:#{job_id}")    
    lang = languages.has_key?(doc["language_facet"][0]) ? languages[doc["language_facet"][0]] : "ud"
    doc["#{field}_#{lang}"]
  end

  def get_related_books(params)
    volume = load_volume_with_names_from_solr(params[:job_id])

    query_array = { 'all' => [], 'title'=> volume[:title], 'language'=> [], 'location'=> [], 'author'=> [], 'name'=> volume[:sci_names],
                    'subject'=> [], 'content' => [], 'publisher' => [] }
    query = set_query_string(query_array, " OR ")

    query.gsub!("AND", " OR ")
    query = "( #{query} ) AND NOT job_id:#{params[:job_id]}"
    result = search_volumes(query, params[:page].to_i, LIMIT_CAROUSEL, "")
    #result[:volumes].each do |item|
    #  result[:volumes].delete(item) if item[:job_id] == params[:job_id].to_i
    #end
    result
  end

  def load_volume_with_names_from_solr(job_id)
    volume = load_volume_without_names_from_solr(job_id)
    if !volume.blank?
      all_sci_names_with_facets = get_sci_names_of_volumes("#{job_id}")
      tmp = all_sci_names_with_facets[:sci_names][job_id.to_i]
      sci_names = tmp.nil? ? [] : tmp
      volume[:sci_names] = sci_names
    end
    volume
  end

  def load_volume_without_names_from_solr(job_id)
    solr_response = load_volume(job_id)
    volume = {}
    unless solr_response["response"]["numFound"] == 0
      doc = solr_response["response"]["docs"][0]
      languages = { "English" => "en", "German" => "ge", "Arabic" => "ar", "French" => "fr", "Italian" => "it" }
      lang = languages.has_key?(doc["language_facet"][0]) ? languages[doc["language_facet"][0]] : "ud"
      volume = { title: doc["title_#{lang}"], author: doc["author_#{lang}"], subject: doc["subject_#{lang}"],
                 rate: doc["rate"], views: doc["views"], job_id: doc["job_id"], date: doc["date"],
                 language: doc["language_facet"], location: doc["location_search"], publisher: doc["publisher_#{lang}"] }
    end
    volume
  end

  private

  def process_solr_volumes(solr_response, query, page, limit)
    volumes = []
    facet_fields = {}

    if solr_response["response"]["numFound"] > 0
      
      all_sci_names_with_facets = get_sci_names_with_facet(query, page, limit)

      solr_response["response"]["docs"].each do |doc|
        tmp = all_sci_names_with_facets[:sci_names][doc[:job_id]]
        sci_names = tmp.nil? ? [] : tmp
        languages = { "English" => "en", "German" => "ge", "Arabic" => "ar", "French" => "fr", "Italian" => "it" }
        lang = languages.has_key?(doc["language_facet"]) ? languages[doc["language_facet"][0]] : "ud"
        options = { title: doc["title_#{lang}"], author: doc["author_#{lang}"], subject: doc["subject_#{lang}"],
                    rate: doc["rate"], views: doc["views"], job_id: doc["job_id"], date: doc["date"],
                    language: doc["language_facet"], location: doc["location_search"], publisher: doc["publisher_#{lang}"], sci_names: sci_names }
        volumes << options
      end

      solr_response.facets.each do |field|
        items  = []
        field.items.first(FACET_COUNT).each do |item|
          items << { field_value: item.value, hits: item.hits }
        end
         facet_fields["#{field.name}"] = items
      end
      facet_fields["name_facet"] = all_sci_names_with_facets[:facets]
    end
    { volumes: volumes, total_number_of_volumes: solr_response["response"]["numFound"], facets: facet_fields }
  end

  def handle_mods_format(id)
    format = ""
    volume = Volume.find_by_job_id(id)
    unless volume.nil?
      mods = Book.find_by_id(volume.book_id).mods
      unless mods.nil?
        mods.slice!(0) if mods[0] == "?" # This should remove leading "?" from mods
        # this is used to beautify xml display
        doc = REXML::Document.new mods
        out = ""
        doc.write(out, 1)
        format = out
      end
    end
    format
  end

  def handle_other_formats(id, book_field)
    format = ""
    volume = Volume.find_by_job_id(id)
    unless volume.nil?
      book_format = Book.find_by_id(volume.book_id)[:book_field]
      unless book_format.nil?
        book_format = book_format[1..-1] if book_format[0] == "?"
        format = book_format if book_format
      end
    end
    format
  end

end
