require 'rails_helper'

RSpec.describe "Homepages", type: :feature do  
  
  describe "header" do
    
    before(:all) do
      Rails.cache.clear      
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
    
    it "includes a link for subjects page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/browse/subjects?char=all']")
    end
    
    it "includes a link for authors page" do
      expect(page).to have_selector("a[href='/#{I18n.locale}/browse/authors?char=all']")
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
      
      it "includes a link for user profile page" do        
        # expect(page).to have_selector("a[href='/users/#{@user.id}']")
      end
      
      it "includes a link for user signout" do
        # expect(page).to have_selector("a[href='/users/signout']")
      end
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
    end
    
    before do
      visit "/"
    end
    
    it "includes bibalex logo" do
      expect(page).to have_selector("img[src='/images_#{I18n.locale}/#{I18n.t('footer.ba_logo')}']")
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
      expect(page).to have_selector("p", text: I18n.t('footer.copyright_statement'))
    end
    
    it "includes a link for facebook share" do
      expect(page).to have_selector("a[class='social-share-button-facebook']")
    end
    
    it "includes a link for twitter share" do
      expect(page).to have_selector("a[class='social-share-button-twitter']")
    end    
  end
    
end
