require 'rails_helper'

RSpec.describe BhlStatistic, type: :model do
  
  describe "get_last_bhl_statistic" do
    
    before do      
      
    end    
    
    it "returns BHL statistics" do
      BhlStatistic.create(books_count: 2, authors_count: 2, species_count: 2)
      statistics = BhlStatistic.get_last_bhl_statistic  
      expect(statistics).to eq({ books: 2, authors: 2, names: 2 })
    end
    
    it "returns hash of zeros if no statiscs found" do
      BhlStatistic.delete_all
      statistics = BhlStatistic.get_last_bhl_statistic
      expect(statistics).to eq({ books: 0, authors: 0, names: 0 })
    end  
  end
  
end
