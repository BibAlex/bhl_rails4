require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "signup" do
    
    before do
      visit new_user_path(locale: I18n.locale)
    end
    
    describe "new user form" do
      
      it "displays username field" do
        expect(page).to have_selector("label", text: I18n.t('common.username'))
        expect(page).to have_field("username")
      end
      
      it "displays password field" do
        expect(page).to have_selector("label", text: I18n.t('common.password'))
        expect(page).to have_field("user_entered_password")
      end
      
      it "displays password confirmation field" do
        expect(page).to have_selector("label", text: I18n.t('common.password_confirmation'))
        expect(page).to have_field("user_entered_password_confirmation")
      end
      
      it "displays email field" do
        expect(page).to have_selector("label", text: I18n.t('common.email'))
        expect(page).to have_field("user_email")
      end
      
      it "displays email confirmation field" do
        expect(page).to have_selector("label", text: I18n.t('common.email_confirmation'))
        expect(page).to have_field("user_email_confirmation")
      end
      
      it "displays real name field" do
        expect(page).to have_selector("label", text: I18n.t('common.real_name'))
        expect(page).to have_field("user_real_name")
      end
      
      it "displays recaptcha field" do
        expect(page).to have_selector("label", text: I18n.t('common.recaptcha'))
      end
      
      it "displays upload photo field" do
        expect(page).to have_selector("label", text: I18n.t('common.upload_photo'))
        expect(page).to have_field("photo_name")
      end
    end    
  end
  
  describe "login" do
    
    before do
      visit login_users_path(locale: I18n.locale)
    end
    
    describe "new user form" do
      
      it "displays username field" do
        expect(page).to have_selector("label", text: I18n.t('common.username'))
        expect(page).to have_field("username")
      end
      
      it "displays password field" do
        expect(page).to have_selector("label", text: I18n.t('common.password'))
        expect(page).to have_field("password")
      end
      
      it "displays a link for forgot password page" do
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/forgot_password']", text: I18n.t('common.forgot_password_link'))
      end
      
      it "displays a link for sign up page" do
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/new']", text: I18n.t('common.signup'))
      end      
    end    
  end
  
  describe "show" do
    
    describe "profile tab" do
      
      context "when the user access his page" do
      
        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user, active: true, username: "@owner_user", password: User.hash_password("@owner_user_password"),
                                                  photo_name: file, real_name: "@owner_user_real", email: "owner@example.com")
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(locale: I18n.locale, id: @owner_user.id)        
        end
        
        it "displays real name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.real_name'))
          expect(page).to have_selector("span", text: @owner_user.real_name)
        end
        
        it "displays user name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.username'))
          expect(page).to have_selector("span", text: "owner_user")
        end
        
        it "displays registeration date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.member_since'))
          expect(page).to have_selector("span", text: @owner_user.created_at)
        end
        
        it "displays last login date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.last_login'))
          expect(page).to have_selector("span", text: @owner_user.last_login)
        end
        
        # cannot test this part because it uses ajax
        it "displays user photo"
        it "displays checkbox to delete user photo"
        
        it "displays an edit link for user profile" do
          expect(page).to have_selector("a[href='/#{I18n.locale}/users/#{@owner_user.id}/edit']", text: I18n.t('common.edit'))
        end
      end
          
      context "when the user access another user's page" do
        
        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user, active: true, username: "@owner_user", password: User.hash_password("@owner_user_password"),
                                                  photo_name: file, real_name: "@owner_user_real", email: "owner@example.com")
          @other_user = FactoryGirl.create(:user, active: true, username: "other_user", password: User.hash_password("other_user_password"),
                                                   email: "other@example.com") 
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(locale: I18n.locale, id: @other_user.id)        
        end
        
        it "displays real name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.real_name'))
          expect(page).to have_selector("span", text: @other_user.real_name)
        end
        
        it "displays user name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.username'))
          expect(page).to have_selector("span", text: "other_user")
        end
        
        it "displays registeration date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.member_since'))
          expect(page).to have_selector("span", text: @other_user.created_at)
        end
        
        it "displays last login date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.last_login'))
          expect(page).to have_selector("span", text: @other_user.last_login)
        end        
      end      
    end 
    
    describe "history tab" do
      
      context "when the user access his page" do
      
        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user, active: true, username: "@owner_user", password: User.hash_password("@owner_user_password"),
                                                  photo_name: file, real_name: "@owner_user_real", email: "owner@example.com")
          #adjust solr
          book_metadata_1 = {job_id: "123", bib_id: "456", title_en: "Book 1", author_en: "Author1", publisher_en: "publisher1",
            subject_en: "subject1"}
          book_metadata_2 = {job_id: "234", bib_id: "567", title_en: "Book 2", author_en: "Author2", publisher_en: "publisher2",
            subject_en: "subject2"}
          solr = RSolr.connect url: SOLR_BOOKS_METADATA
          solr.delete_by_query("job_id: 123")
          solr.delete_by_query("job_id: 234")
          solr.commit
          solr.add book_metadata_1
          solr.add book_metadata_2
          solr.commit
  
          @vol_first = Volume.create(book: Book.create(title: 'Book 1', bib_id: '456'), job_id: "123")
          @vol_second = Volume.create(book: Book.create(title: 'Book 2', bib_id: '567'), job_id: "234")
          UserVolumeHistory.create(volume_id: @vol_first.id, user_id: @owner_user.id, updated_at: Time.now)
          UserVolumeHistory.create(volume_id: @vol_second.id, user_id: @owner_user.id, updated_at: Time.now)
        end
        
        context "logged in user" do
          before do
            page.set_rack_session(user_id: @owner_user.id)
            visit user_path(locale: I18n.locale, id: @owner_user.id, tab: "history") 
          end
          
          it "should display last visited date" do
            expect(page).to have_selector("small", text: "#{(UserVolumeHistory.first).updated_at}")
          end
          
          it "should have item count equal to the total number of books" do
            expect(page).to have_selector("span[class='badge']", text: 2.to_s)
          end
        
          it "should have book title that links for details" do
            expect(page).to have_selector("a[href= \"/en/books/#{@vol_first.book_id}\"]")
            expect(page).to have_selector("a[href= \"/en/books/#{@vol_second.book_id}\"]")
          end
          
          it "should have details link for each book" do
            expect(page).to have_selector("a[href= \"/en/books/#{@vol_first.book_id}\"]", text: I18n.t('common.details'))
            expect(page).to have_selector("a[href= \"/en/books/#{@vol_second.book_id}\"]", text: I18n.t('common.details'))
          end
        
          it "should have read link for each book" do
            expect(page).to have_selector("a[href= \"/en/books/#{@vol_first.book_id}?tab=read\"]")
            expect(page).to have_selector("a[href= \"/en/books/#{@vol_second.book_id}?tab=read\"]")
          end
        
        end
        
        context "not logged in user" do
          before do
            visit user_path(locale: I18n.locale, id: @owner_user.id, tab: "history") 
          end
            
          it "should redirect to login page" do
            expect(page).to have_field("username")
            expect(page).to have_field("password")
          end
        end
        
      end
          
      context "when the user access another user's page" do
        
        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user, active: true, username: "@owner_user", password: User.hash_password("@owner_user_password"),
                                                  photo_name: file, real_name: "@owner_user_real", email: "owner@example.com")
          @other_user = FactoryGirl.create(:user, active: true, username: "other_user", password: User.hash_password("other_user_password"),
                                                   email: "other@example.com") 
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(locale: I18n.locale, id: @other_user.id)        
        end
        
        it "displays real name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.real_name'))
          expect(page).to have_selector("span", text: @other_user.real_name)
        end
        
        it "displays user name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.username'))
          expect(page).to have_selector("span", text: "other_user")
        end
        
        it "displays registeration date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.member_since'))
          expect(page).to have_selector("span", text: @other_user.created_at)
        end
        
        it "displays last login date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.last_login'))
          expect(page).to have_selector("span", text: @other_user.last_login)
        end        
      end      
    end
       
  end 
end
