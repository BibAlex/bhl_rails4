module SolrHelper
  
  def solr_autocomplete(field, term, limit)
    if field == 'name'
      rsolr = RSolr.connect url: SOLR_SCI_NAMES
      response = rsolr.find 'q' => "*:*", 'facet' => true, 'facet.field' => "sci_name_suggest", 'facet.limit' => limit,
                                                           'facet.prefix' => term.downcase, 'rows' => 0
    else
      rsolr = RSolr.connect url: SOLR_BOOKS_METADATA
      response = rsolr.find 'q' => "*:*", 'facet' => true, 'facet.field' => "#{field}_auto", 'facet.limit' => limit,
                                                           'facet.prefix' => term.downcase, 'rows' => 0
    end    
    response.facets.first.items
  end  
    
  def search_facet_highlight(query, page, limit, sort_type, fquery= nil, not_all_categories_query = true)
    facet_array = ['author_facet', 'language_facet', 'subject_facet', 'location_facet', 'publisher_facet']
    start = (page > 1) ? (page - 1) * limit : 0
    solr = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
    query = not_all_categories_query ? "#{query} AND _query_:\"#{fquery}\"" : "#{query} OR _query_:\"#{fquery}\""
    response = solr.find  'q' => query, 'sort' => sort_type, 'facet' => true, 'start' =>  start, 'rows' => limit,
                          'facet.field' => facet_array, 'facet.mincount' => "1", 'facet.limit' => "4"
    response
  end
  
  def get_sci_names_of_volumes(job_ids)
    rsolr = RSolr.connect url: SOLR_NAMES_FOUND
    response = rsolr.find 'q' => "job_id:#{job_ids}", 'fl' => 'job_id,sci_name', 'rows' => 1000000, 
                                                      'facet' => true, 'facet.field' => "sci_name"
    sci_names = {}
    
    if response["response"]["numFound"] > 0
      response["response"]["docs"].each do |doc|
        if sci_names.has_key?(doc[:job_id])
          sci_names[doc[:job_id]] << doc[:sci_name]
        else
          sci_names[doc[:job_id]] = [doc[:sci_name]]
        end        
      end
    end    
    { sci_names: sci_names }
  end
  
  
  def get_sci_names_with_facet(query, page, limit, fquery)
    rsolr = RSolr.connect url: SOLR_NAMES_FOUND
    response = rsolr.find 'q' => fquery, 'fq' => "{!join from=job_id to=job_id fromIndex=books_metadata} #{query}",
                                         'fl' => 'job_id,sci_name', 'facet' => true,
                                         'facet.field' => "sci_name", 'facet.limit' => 4    
    items  = []
    response.facets.first.items.first(FACET_COUNT).each do |item|
      items << { field_value: item.value, hits: item.hits }
    end 
    { facets: items }
  end
  
  def get_name_info(sci_name)
    rsolr = RSolr.connect url: SOLR_SCI_NAMES
    response = rsolr.find 'q' => "sci_name_search:#{sci_name}", 'fl' => "sci_name,eol_url,thumb"
    response["response"]["docs"][0]
  end
  
  def get_volumes_contain_sci_name(sci_names, query_join_operator)
    job_ids = []
    exact_sci_names = get_exact_sci_names(sci_names)
    if exact_sci_names.blank?
      values = sci_names.join(query_join_operator)
    else
      values = exact_sci_names.join(query_join_operator)
    end
    rsolr = RSolr.connect url: SOLR_NAMES_FOUND
    field_query = "(sci_name:#{values})"
    response = rsolr.find 'q' => field_query, 'fl' => "job_id", 'rows' => 1000000
    unless response["response"]["numFound"] == 0
      response["response"]["docs"].each do |doc|
        job_ids << doc[:job_id] unless job_ids.include?(doc[:job_id])
      end
    end
    job_ids
  end
  
  def get_exact_sci_names(sci_names)
    exact_sci_names = []
    values = "(" + sci_names.map { |s| "\"#{s}\"" }.join(" OR ") + ")"
    rsolr = RSolr.connect url: SOLR_SCI_NAMES
    response = rsolr.find 'q' => "sci_name_search:#{values}", 'fl' => "sci_name"
    unless response["response"]["numFound"] == 0
      response["response"]["docs"].each do |doc|
        exact_sci_names << doc[:sci_name]
      end
    end
    exact_sci_names
  end  
  
  def load_volume(job_id)
    rsolr = RSolr.connect url: SOLR_BOOKS_METADATA
    rsolr.find 'q' => "job_id:#{job_id}"
  end
  
  def item_count (type, item)
    rsolr = RSolr.connect url: SOLR_BOOKS_METADATA
    #Added double quotes over item to handle special characters like "[" and "]"
    search = rsolr.find 'q' => type + ":" + "\"#{item}\"", 'rows' => 0
    search['response']['numFound']
  end
  
  def update_volume_rate_in_solr(job_id, avg_rate)
    doc = SolrHelper.solr_find_document("job_id:#{job_id}")
    doc[:rate] = avg_rate
    solr = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
    solr.update data: solr.xml.add(doc)
    solr.commit
    solr.optimize
  end
  
  def self.solr_find_document(query)
    solr = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
    response = solr.find q: query, start: 0, limit: 1
    response['response']['docs'][0]
  end
  
  def self.update_volume_views_in_solr(job_id)
    doc = solr_find_document("job_id:#{job_id}")
    doc[:views] = doc[:views] + 1
    solr = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
    solr.update data: solr.xml.add(doc)
    solr.commit
    solr.optimize
  end
  
  def load_geolocations_from_solr(item)
    solr = RSolr.connect url: SOLR_GEOLOCATIONS
    response = solr.find q: "address:\"#{item}\"", start: 0, limit: 1
    response["response"]["docs"][0]    
  end
 end 
  