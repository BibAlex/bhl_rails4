module BooksHelper
  
  def facet_list(response, field)
    list = []
    response.facets.each do |facet|
      if facet.name == field
        facet.items.each do |item|
          if (item.hits) > 0
            list << {:name => item.value, :count => item.hits}
          end
        end
        break
      end
    end
    list
  end


  # not updated: will be updated after finishing books search function
  def add_facet_search(params, type, field)
      tmp_params = params.clone
      if tmp_params.has_key?("_#{type}".to_sym)
        tmp_params["_#{type}".to_sym] = field + " _AND " + tmp_params["_#{type}".to_sym]
      else
        tmp_params["_#{type}".to_sym] = field
      end
      tmp_params[:controller] = nil
      tmp_params[:action] = nil
      tmp_params[:page] = nil
      tmp_params[:sort_type] = nil
      tmp_params[:locale] = nil
      tmp_params
  end
  
  def search_volumes(query, page, limit, sort_type)
    response = search_facet_highlight(query, page, limit, sort_type)
    process_solr_volumes(response)
  end
  
  def fill_response_array(arr)
    counter = 1
    array = []
    if(arr.count > 1)
      arr.each do |term|
        if(counter > MAX_NAMES_PER_BOOK)
          break
        else
          array << term
          counter += 1
        end
      end
    else
      array << arr[0]
    end
    array
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
                      <li><a href='../books/#{job_id}/read'>#{I18n.t(:find_in_book)}</a>"
    if eol_page_id != nil && eol_page_id > -1
      title_tip += "<li><a href='http://eol.org/pages/#{eol_page_id}'>#{I18n.t(:view_in_eol)}</a>"
    end
    title_tip += "<li><a href='../books?_name=#{string}'>#{I18n.t(:books_with_name)}</a>
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
    search_params = params.select { |key, value| ["_title", "_subject", "_language", "_author", "_name", "_location", "_publisher", "_content"].include?(key) }
    query_array = { 'ALL' => [], 'title'=> [], 'language'=> [], 'location'=> [], 'author'=> [], 'name'=> [],
                    'subject'=> [], 'content' => [], 'publisher' => [] }  
    query_array.each do  |key, value|
      query_array[key] = search_params["_#{key}".to_sym] ? search_params["_#{key}".to_sym].split(' _AND ') : []
    end
    query_array
  end
  
  
  def set_query_string(query_array)    
    emptyQuery = is_empty_search?(query_array)    
    if(emptyQuery)
      query = "*:*"
    else
      multilingual_attributes = get_multilingual_attributes(query_array)
      normal_attributes = get_normal_attributes(query_array)      
      if(!(query_array['ALL'].empty?))
        query = prepare_search_query(multilingual_attribute, normal_attributes, "OR")
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
    languages = Language.select(:code)
    multilingual_query = ''
    normal_query = ''
    
    unless multilingual_attributes_and_values.empty?
      multilingual_attributes_and_values.each do |key, value_arr|
        field_query = '('
        values = "\"" + value_arr.join(" AND ") + "\""
        languages.each do |language|
          field_query += field_query == '(' ? "#{key}_#{language.code[0..1]}:#{values}" : " OR #{key}_#{language.code[0..1]}:#{values}"
        end
        field_query += ")"
        multilingual_query += multilingual_query == '' ? field_query : " #{query_join_operator} #{field_query}"
      end      
    end    
    
    normal_attributes_and_values.each do |key, value_arr|
       field_query = '('
       if key == "job_id"
         values = "\"" + value_arr.join(" OR ") + "\""
       else
         values = "\"" + value_arr.join(" AND ") + "\""
       end       
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
    multilingual_attributes[:title] = query_array['title'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['title']
    multilingual_attributes[:author] = query_array['author'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['author']
    multilingual_attributes[:subject] = query_array['subject'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['subject']
    multilingual_attributes[:publisher] = query_array['publisher'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['publisher']
    multilingual_attributes[:content] = query_array['content'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['content']   
    multilingual_attributes.delete_if { |key, value| value.blank? }
  end
  
  def get_normal_attributes(query_array)
    normal_attributes = { }
    normal_attributes[:location_search] = query_array['location'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['location']
    normal_attributes[:language_facet] = query_array['language'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['language']
    sci_names = query_array['name'].empty? ? (query_array['ALL'].empty? ? query_array['ALL'] : nil) : query_array['name']
    job_ids = get_volumes_contain_sci_name(sci_names)
    normal_attributes[:job_id] = job_ids.empty? ? nil : job_ids
    normal_attributes.delete_if { |key, value| value.blank? }    
  end
  
  
  def remove_bread_crumb(params, type, field)
    tmp_params = params.clone
    if (tmp_params["_#{type}".to_sym].include?("#{field} _AND "))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub("#{field} _AND ", '')
    elsif (tmp_params["_#{type}".to_sym].include?(" _AND #{field}"))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub(" _AND #{field}", '')
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

  
  private
  
  def process_solr_volumes(solr_response)
    volumes = []
    facet_fields = {}
    
    if solr_response["response"]["numFound"] > 0    
      job_ids = "("
      solr_response["response"]["docs"].each do |doc|
        job_ids += job_ids == "(" ? doc["job_id"].to_s : " OR  #{doc[:job_id]}"
      end
      
      all_sci_names_with_facets = get_sci_names_of_volumes("#{job_ids} )")
  
      solr_response["response"]["docs"].each do |doc|
        tmp = all_sci_names_with_facets[:sci_names]["#{doc[:job_id]}"]
        sci_names = tmp.nil? ? [] : tmp
        lang = doc["language_facet"][0][0..1]
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
      facet_fields[:name] = all_sci_names_with_facets[:facets]
    end
    { volumes: volumes, total_number_of_volumes: solr_response["response"]["numFound"], facets: facet_fields }
  end

end