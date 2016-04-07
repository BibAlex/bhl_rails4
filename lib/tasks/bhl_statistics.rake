namespace :bhl_statistics do
  desc 'Load bhl statistics from solr to db'
  task :load_bhl_statistics_from_solr => :environment do
    solr_books_core = RSolr.connect url: SOLR_BOOKS_METADATA
    response = solr_books_core.find 'q' => "*:*", 'facet' => true, 'facet.field' => "author_facet",'facet.limit' => 100000, 'rows' => 0
    solr_sci_names_core = RSolr.connect url: SOLR_SCI_NAMES
    sci_names = solr_sci_names_core.find 'q' => "*:*", 'rows' => 0
    BhlStatistic.create(books_count: response['response']['numFound'], authors_count: response["facet_counts"]["facet_fields"]["author_facet"].count/2,
                        species_count: sci_names['response']['numFound'])
  end
end