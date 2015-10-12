require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  
  describe "home" do
    
    before do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1"  })
      solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', title_en: 'title_2', author_en: "author_2", subject_en: "subject_2" })
      solr_books_core.commit
      
      solr_books_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit    
      solr_books_core.add({ sci_name: 'name_1' })
      solr_books_core.add({ sci_name: 'name_2' })
      solr_books_core.commit
      
      BhlStatistic.create(books_count: 2, authors_count: 2, species_count: 2)
    end
    
    before do
      get :home
    end
    
    describe "statistics" do
      it "returns BHL statistics" do          
        expect(assigns(:statistics)).to eq({ books: 2, authors: 2, names: 2 })
      end    
    end    
  end
  
  describe "about_us" do    
    
    before do
      get :about
    end
    
    it "returns a 200 ok status" do
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the about us template" do
      expect(response).to render_template(:about)
    end
  end
  
  describe "contact_us" do    
    
    before do
      get :contact
    end
    
    it "returns a 200 ok status" do
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the about us template" do
      expect(response).to render_template(:contact)
    end
  end
    
end
