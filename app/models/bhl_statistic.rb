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
  end
end

