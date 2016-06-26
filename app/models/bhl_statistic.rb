class BhlStatistic < ActiveRecord::Base

  def self.get_last_bhl_statistic
    bhl_statistic = BhlStatistic.last
    if bhl_statistic
      statistics_result = { books: bhl_statistic.books_count,
                            authors: bhl_statistic.authors_count,
                            names: bhl_statistic.species_count }
    else
      statistics_result = { books: 0, authors: 0, names: 0 }
    end
    statistics_result
  end

  def self.get_bhl_statistics_from_solr
    solr_books_core = RSolr.connect url: SOLR_BOOKS_METADATA
    response = solr_books_core.find 'q' => '*:*',
                                    'facet' => true,
                                    'facet.field' => 'author_facet',
                                    'facet.limit' => 100000,
                                    'rows' => 0
    solr_sci_names_core = RSolr.connect url: SOLR_NAMES_FOUND
    names_found = solr_sci_names_core.find 'q' => '*:*', 'rows' => 0
    statistics_result = { books: response['response']['numFound'],
                          authors: response['facet_counts']['facet_fields']['author_facet'].count/2,
                          names: names_found['response']['numFound'] }
    statistics_result
  end
end

