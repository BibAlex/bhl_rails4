require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  
  describe "books autocomplete" do
    before(:all) do
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
    end
    
    describe "title autocomplete" do
      context "when result found" do
        it "returns a list of titles matching the entered title" do
          get :autocomplete, type: "title", term: 'tit'
          expect(assigns(:results)).to eq(['title_1', 'title_2'])
        end
      end
      
      context "when no result found" do
        it "returns no suggestions when no result found" do
          get :autocomplete, type: "title", term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end
    
    describe "author autocomplete" do
      context "when result found" do
        it "returns a list of authors matching the entered author" do
          get :autocomplete, type: "author", term: 'auth'
          expect(assigns(:results)).to eq(['author_1', 'author_2'])
        end
      end
      
      context "when no result found" do
        it "returns no suggestions when no result found" do
          get :autocomplete, type: "author", term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end
    
    describe "subject autocomplete" do
      context "when result found" do
        it "returns a list of subjects matching the entered subject" do
          get :autocomplete, type: "subject", term: 'subj'
          expect(assigns(:results)).to eq(['subject_1', 'subject_2'])
        end
      end
      
      context "when no result found" do
        it "returns no suggestions when no result found" do
          get :autocomplete, type: "subject", term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end
    
    describe "names autocomplete" do
      context "when result found" do
        it "returns a list of names matching the entered name" do
          get :autocomplete, type: "name", term: 'nam'
          expect(assigns(:results)).to eq(['name_1', 'name_2'])
        end
      end
      
      context "when no result found" do
        it "returns no suggestions when no result found" do
          get :autocomplete, type: "name", term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end    
  end 
end