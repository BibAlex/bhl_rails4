require 'rails_helper'

RSpec.describe "Homepages", type: :feature do  
  
  describe "header" do
    
    before do
      visit "/"
    end
    
    it "includes BHL logo" do
      expect(page).to have_selector("img[src='/images_#{I18n.locale}/logo.png']")
    end
    
    it "includes a link for arabic language" do
      expect(page).to have_selector("a[href='/ar']")
    end
    
    it "includes a link for home page" do
      expect(page).to have_selector("a[href='/']")
    end
    
    it "includes a link for about us page" do
      expect(page).to have_selector("a[href='/pages/about']")
    end
    
    it "includes a link for browse all books page" do
      expect(page).to have_selector("a[href='/books']")
    end
    
    it "includes a link for subjects page" do
      expect(page).to have_selector("a[href='/browse/subjects?char=all']")
    end
    
    it "includes a link for authors page" do
      expect(page).to have_selector("a[href='/browse/authors?char=all']")
    end
    
    it "includes a link for geographics page" do
      expect(page).to have_selector("a[href='/geographics']")
    end
    
    it "includes a link for collections page" do
      expect(page).to have_selector("a[href='/collections']")
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
        expect(page).to have_selector("a[href='/users/new']")
      end
      
      it "includes a link for login page" do
        expect(page).to have_selector("a[href='/users/login']")
      end
    end
    
  end
    
end
