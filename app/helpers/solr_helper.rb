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
  
    def browse_facet(type, prefix)
      rsolr = RSolr.connect url: SOLR_BOOKS_METADATA
      response = rsolr.find 'q' => "*:*", 'facet' => true, 'facet.field' => "#{type}_auto", 'facet.prefix' => prefix, 'facet.limit' => 1000000, 'rows' => 0    
      res = []
      response.facets.first.items.each do |item|
        res << item if item.value.downcase.start_with?(prefix.downcase)
      end
      res
  end  
end