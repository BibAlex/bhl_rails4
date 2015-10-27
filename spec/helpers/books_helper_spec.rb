require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BooksHelper. For example:
#
# describe BooksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BooksHelper, type: :helper do
  
  include SolrHelper
  
  describe "search_volumes" do
    
    before(:all) do
      Rails.cache.clear     
      
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1", views: 1, rate: 5 })
      solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', title_en: 'title_2', author_en: "author_2", subject_en: "subject_2", views: 3, rate: 2 })
      solr_books_core.commit
       
      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit    
      solr_names_found_core.add({ job_id: 2, sci_name: 'sci_name_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.add({ job_id: 2, sci_name: 'sci_name_2', page: 1, name_found: 'name_2' })
      solr_names_found_core.add({ job_id: 1, sci_name: 'sci_name_1_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.commit
    end
    
    context "when volumes are sorted by number of views" do
      it "returns top volumes sorted by number of views in DESC order" do
        expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "views desc")[:volumes].first[:job_id]).to eq(2)
        expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "views desc")[:volumes].last[:job_id]).to eq(1)
      end
      
      describe "search volume entry" do
        
        it "returns subjects of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "views desc")[:volumes].first[:subject]).to eq(["subject_2"])
        end
        
        it "returns title of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "views desc")[:volumes].first[:title]).to eq(["title_2"])
        end
        
        it "returns authors of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "views desc")[:volumes].first[:author]).to eq(["author_2"])
        end
        
        it "returns names of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "views desc")[:volumes].first[:sci_names]).to eq(["sci_name_1", "sci_name_2"])
        end        
      end      
    end
    
    context "when volumes are sorted by rate" do
      it "returns top volumes sorted by number rate in DESC order" do
        expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "rate desc")[:volumes].first[:job_id]).to eq(1)
        expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "rate desc")[:volumes].last[:job_id]).to eq(2)
      end
      
      describe "search volume entry" do
        
        it "returns subjects of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "rate desc")[:volumes].first[:subject]).to eq(["subject_1"])
        end
        
        it "returns title of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "rate desc")[:volumes].first[:title]).to eq(["title_1"])
        end
        
        it "returns authors of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "rate desc")[:volumes].first[:author]).to eq(["author_1"])
        end
        
        it "returns names of volume" do
          expect(search_volumes("*:*", 1, MOST_VIEWED_BOOKS, "rate desc")[:volumes].first[:sci_names]).to eq(["sci_name_1_1"])
        end        
      end      
    end
    
  end
  
  
end
