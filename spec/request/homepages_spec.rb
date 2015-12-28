require 'rails_helper'

RSpec.describe "Homepages", type: :feature do  
  
  describe "header" do
    
    before(:all) do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit  
    end
    
    before do
      visit root_path(locale: I18n.locale)
    end
    
    it "includes BHL logo" do
      expect(page).to have_selector("img[src='/images_#{I18n.locale}/logo.png']")
    end    
    
    it "includes a link for home page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}']")
    end
    
    it "includes a link for about us page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/pages/about']")
    end
    
    it "includes a link for browse all books page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/books']")
    end    
    
    it "includes a link for geographics page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/geographics']")
    end
    
    it "includes a link for collections page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/collections']")
    end
    
    it "includes a search box for books meta info" do
      expect(page).to have_selector("div[class=topsearch]")
    end
     
    context "when user is logged in" do
      
      before(:all) do
        
      end
      
      it "includes a link for user profile page"
      
      it "includes a link for user signout"
    end
    
    context "when user is not  logged in" do      
      it "includes a link for signup page" do
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/new']")
      end
      
      it "includes a link for login page" do
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/login']")
      end
    end
    
  end
  
  describe "footer" do
    
    before(:all) do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
    end
    
    before do
      visit "/"
    end
    
    it "includes bibalex logo" do
      expect(page).to have_selector("img[src='/images_#{I18n.locale}/#{I18n.t('common.ba_logo')}']")
    end    
    
    it "includes a link for home page" do
      expect(page).to have_selector("a[href='/']")
    end
    
    it "includes a link for about us page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/pages/about']")
    end
    
    it "includes a link for contact us page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/pages/contact']")
    end
    
    it "includes copyright of bibalex" do
      expect(page).to have_selector("p", text: I18n.t('common.copyright_statement'))
    end
    
    it "includes a link for facebook share" do
      expect(page).to have_selector("a[class='social-share-button-facebook']")
    end
    
    it "includes a link for twitter share" do
      expect(page).to have_selector("a[class='social-share-button-twitter']")
    end    
  end
  
  describe "home content" do
    
    before do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1", views: 1, rate: 5  })
      solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', title_en: 'title_2', author_en: "author_2", subject_en: "subject_2", views: 3, rate: 2 })
      solr_books_core.commit
      
      solr_sci_names_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_sci_names_core.delete_by_query('*:*')
      solr_sci_names_core.commit    
      solr_sci_names_core.add({ sci_name: 'name_1' })
      solr_sci_names_core.add({ sci_name: 'name_2' })
      solr_sci_names_core.commit
      
      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit    
      solr_names_found_core.add({ job_id: 2, sci_name: 'sci_name_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.add({ job_id: 2, sci_name: 'sci_name_2', page: 1, name_found: 'name_2' })
      solr_names_found_core.add({ job_id: 1, sci_name: 'sci_name_1_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.commit
      
      BhlStatistic.create(books_count: 2, authors_count: 2, species_count: 2)
      
      @user = User.first
      @collection = FactoryGirl.create(:collection, user: @user, title: "new_collection", is_public: true, rate: 5)
      FactoryGirl.create(:activity, activitable_id: @collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "create", user_id: @user.id, created_at: Time.now)
      FactoryGirl.create(:activity, activitable_id: @collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "rate", user_id: @user.id, value: 5, created_at: Time.now + 2)
      FactoryGirl.create(:activity, activitable_id: @collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "comment", user_id: @user.id, value: "good_collection", created_at: Time.now + 3)                                    
    end
    
    before do
      visit root_path(locale: I18n.locale)
    end
    
    describe "statistics" do
      it "displays a link for books page with total number of books in BHL" do          
        expect(page).to have_selector("a[href='/#{I18n.locale}/books']", text: I18n.t('common.book_count', count: 2))
      end
      
      it "displays the total number of authors in BHL" do          
        expect(page).to have_selector("h4[class='alert alert-warning']", text: I18n.t('common.author_count', count: 2))
      end
      
      it "displays a link for species page with total number of species in BHL" do          
        expect(page).to have_selector("a[href='/#{I18n.locale}/names']", text: I18n.t('common.tagged_species', count: 2))
      end
    end
    
    describe "activity_log" do
      
      it "displays a link for activities page" do          
        expect(page).to have_selector("a[href='/#{I18n.locale}/activities']", text: I18n.t('common.activity_log'))
      end
      
      it "displays total number of activities" do          
        expect(page).to have_selector("span[class='badge']", text: 3)
      end
      
      # this part uses ajax call so we can't test it using rspec
      describe "activity entry" do
      end  
    end
    
    describe "top_collections" do
      it "displays a link for collections page" do          
        expect(page).to have_selector("a[href='/#{I18n.locale}/collections?sort_type=rate+desc']", text: I18n.t('common.top_collections'))
      end
      
      describe "top collections entry" do
        
        it "display a link for top collection entry" do
          expect(page).to have_selector("div[id='top_collections']") do |div|
            expect(div).to have_selector("a[href='/#{I18n.locale}/collections/#{@collection.id}']", text: @collection.title)
          end          
        end
        
        it "display a link for top collection owner" do
          expect(page).to have_selector("div[id='top_collections']") do |div|
            expect(page).to have_selector("a[href='/#{I18n.locale}/users/#{@user.id}']", text: @user.real_name)
          end          
        end        
      end      
    end
    
    describe "most_viewed_books" do
      it "displays a tab for most viewed books" do          
        expect(page).to have_selector("h4", text: I18n.t('common.most_viewed'))
      end
      
      describe "volume entry for most viewed books" do
        
        it "display a link for volume page" do
          expect(page).to have_selector("a[href='/#{I18n.locale}/books/2']", text: "title_2")
        end
        
        it "display a link for volume read page" do
          expect(page).to have_selector("a[href='/#{I18n.locale}/books?id=2&tab=read']", text: I18n.t('common.read'))
        end
        
        it "display a link for volume details page" do
          expect(page).to have_selector("a[href='/#{I18n.locale}/books/2']", text: I18n.t('common.details'))
        end
        
        it "display a cover photo for the volume" do
          expect(page).to have_selector("div[class='bk-cover']")
        end
        
      end      
    end
    
  end

    
end
