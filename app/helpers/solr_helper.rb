module SolrHelper
  
  def solr_autocomplete(field, term, limit)
    if field == 'name'
      rsolr = RSolr.connect url: SOLR_SCI_NAMES
      response = rsolr.find 'q' => "*:*", 'facet' => true, 'facet.field' => "sci_name_suggest", 'facet.limit' => limit, 'facet.prefix' => term.downcase, 'rows' => 0
    else
      rsolr = RSolr.connect url: SOLR_BOOKS_METADATA
      response = rsolr.find 'q' => "*:*", 'facet' => true, 'facet.field' => "#{field}_auto", 'facet.limit' => limit, 'facet.prefix' => term.downcase, 'rows' => 0
    end    
    response.facets.first.items
  end  
    
  def search_facet_highlight(query, page, limit, sort_type)
    facet_array = ['author_facet', 'language_facet', 'subject_facet', 'location_facet']
    start = (page > 1) ? (page - 1) * limit : 0
    solr = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
    response = solr.find  'q' => query, 'sort' => sort_type, 'facet' => true, 'start' =>  start, 'rows' => limit,
                          'facet.field' => facet_array, 'facet.mincount' => "1", 'facet.limit' => "4"
    response
  end
  
  def get_sci_names_of_volume(job_id)
    rsolr = RSolr.connect url: SOLR_NAMES_FOUND
    response = rsolr.find 'q' => "job_id:#{job_id}", 'facet' => true, 'facet.field' => "sci_name", 'rows' => 0
    sci_names = []
    if response["response"]["numFound"] > 0
      response.facets.first.items.each do |item|
        sci_names << item.value unless item.hits == 0
      end
    end
    sci_names
  end
  
  def get_name_info(sci_name)
    rsolr = RSolr.connect url: SOLR_SCI_NAMES
    response = rsolr.find 'q' => "sci_name:#{sci_name}", 'fl' => "sci_name,eol_url,thumb"
    response["response"]["docs"][0]
  end
end