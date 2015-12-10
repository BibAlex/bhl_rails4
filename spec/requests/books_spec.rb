require 'rails_helper'

require_relative '../../lib/bhl/login'

include BHL::Login

RSpec.describe "Books", type: :request do  
  
  describe "GET /books" do
        
    before(:all) do
      
      Language.create(code: 'eng', name: "english")
      
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1",
                            publisher_en: "publisher_1", location_search: "location_1", rate: 5, views: 2  })
      solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', title_en: 'title_2', author_en: "author_2", subject_en: "subject_2",
                            publisher_en: "publisher_2", location_search: "location_2", rate: 3, views: 3 })
      solr_books_core.commit
      
      solr_books_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit    
      solr_books_core.add({ sci_name: 'sci_name_1' })
      solr_books_core.add({ sci_name: 'sci_name_2' })
      solr_books_core.commit
      
      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit    
      solr_names_found_core.add({ job_id: 2, sci_name: 'sci_name_2', page: 1, name_found: 'name_2' })
      solr_names_found_core.add({ job_id: 1, sci_name: 'sci_name_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.commit
      
    end
    
    it "displays total number of books" do
      visit books_path(locale: I18n.locale)
      expect(page).to have_selector("h4", text: "#{I18n.t('common.found')} #{I18n.t('home.statistics.book_count', count: 2)}")
    end
    
    it "displays pagination block" do
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      doc = { language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1",
              publisher_en: "publisher_1", location_search: "location_1", rate: 5, views: 2  }
              
      (3..15).each do |index|
        doc[:job_id] = index
        solr_books_core.add(doc)
        solr_books_core.commit
      end
      
      visit books_path(locale: I18n.locale)
      expect(page).to have_selector("div[class='pagination-centered']")
      
      (3..15).each do |index|
        solr_books_core.delete_by_query("job_id:#{index}")
      end
    end
    
    it "displays a link for sort books by views" do
      visit books_path(locale: I18n.locale)
      expect(page).to have_selector("a[href='/#{I18n.locale}/books?sort_type=views+DESC']")
    end
    
    it "displays a link for sort books by rate" do
      visit books_path(locale: I18n.locale)
      expect(page).to have_selector("a[href='/#{I18n.locale}/books?sort_type=rate+DESC']")
    end
    
    it "displays a link for sort books by book title" do
      visit books_path(locale: I18n.locale)
      expect(page).to have_selector("a[href='/#{I18n.locale}/books?sort_type=title_sort+DESC']")
    end
    
    describe "volume entry for most viewed books" do
        
      it "display a link for volume page" do
        visit books_path(locale: I18n.locale)
        expect(page).to have_selector("a[href='/#{I18n.locale}/books/1']", text: "title_1")
      end
      
      it "display a link for volume read page" do
        visit books_path(locale: I18n.locale)
        expect(page).to have_selector("a[href='/#{I18n.locale}/books?id=2&tab=read']", text: I18n.t('common.read'))
      end
      
      it "display a link for volume details page" do
        visit books_path(locale: I18n.locale)
        expect(page).to have_selector("a[href='/#{I18n.locale}/books/2']", text: I18n.t('common.details'))
      end
      
      it "display a cover photo for the volume" do
        visit books_path(locale: I18n.locale)
        expect(page).to have_selector("div[class='bk-cover']")
      end      
    end   
  end
  
  
  describe "GET /books/show" do
        
    before(:all) do
      book = FactoryGirl.create(:book)
      volume = FactoryGirl.create(:volume, job_id: 1, book_id: book.id)
      Language.create(code: 'eng', name: "english")
      
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1",
                            publisher_en: "publisher_1", location_search: "location_1", rate: 5, views: 2  })
      solr_books_core.commit
      
      solr_books_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit    
      solr_books_core.add({ sci_name: 'sci_name_1' })
      solr_books_core.add({ sci_name: 'sci_name_2' })
      solr_books_core.commit
      
      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit    
      solr_names_found_core.add({ job_id: 1, sci_name: 'sci_name_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.commit
      
    end
    
    it "display title of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("h3", text: "title_1")
    end
    
    it "display language of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("dt", text: I18n.t('common.language'))
      expect(page).to have_selector("dd", text: "eng (1)")
    end
    
    it "display location of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("dt", text: I18n.t('common.location'))
      expect(page).to have_selector("dd", text: "location_1")
    end
    
    it "display authors of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("dt", text: I18n.t('common.author'))
      expect(page).to have_selector("dd", text: "author_1")
    end
    
    it "display subject of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("dt", text: I18n.t('common.subject'))
      expect(page).to have_selector("dd", text: "subject_1")
    end
    
    it "display publisher of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("dt", text: I18n.t('common.publisher'))
      expect(page).to have_selector("dd", text: "publisher_1")
    end
    
    it "display species of volume" do
      visit book_path(id: 1)
      expect(page).to have_selector("dt", text: I18n.t('header.search.option_tagged_species'))
      expect(page).to have_selector("dd") do |div|
        expect(page).to have_selector("a", text: "sci_name_1")
      end      
    end
    
    describe "add_book_to_collection" do
      context "when user is logged in" do
        it "displays a link for add book to collection", :js => true do
          FactoryGirl.create(:user, password: User.hash_password('password'), active: true) unless User.first
          user = User.first
          visit("/users/login")
          fill_in "username", :with => "#{user.username}"
          fill_in "password", :with => "password"
          find("#submit").click          
          visit book_path(id: 1)
          expect(page).to have_selector("a", text: I18n.t('common.add_collection'))
        end
      end
      
      context "when user is not logged in" do
        it "displays a link for add book to collection" do
          visit book_path(id: 1)
          expect(page).not_to have_selector("a", text: I18n.t('common.add_collection'))
        end
      end
    end    
  end
end
