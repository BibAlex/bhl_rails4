module DataCleanser
  # Should only be used in development and test (if needed)
  class DatabaseAndSolrCleaner
    def self.clean_db_and_solr
      DatabaseCleaner.clean_with :truncation
      
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      
      solr_sci_names_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_sci_names_core.delete_by_query('*:*')
      solr_sci_names_core.commit
      
      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit
      
      solr_locations_core = RSolr::Ext.connect url: SOLR_GEOLOCATIONS
      solr_locations_core.delete_by_query('*:*')
      solr_locations_core.commit
    end
  end
end
