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
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/forgot_password']", text: I18n.t('common.forgot_password'))
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
    describe "annotations tab" do
      before do
        @owner_user = FactoryGirl.create(:user, active: true, username: "owner_user",
                        password: User.hash_password("owner_user_password"), real_name: "owner_user_real")
        @other_user = FactoryGirl.create(:user, active: true, username: "other_user", 
                      password: User.hash_password("other_user_password"),email: "other@example.com") 
        @book1 = FactoryGirl.create(:book)
        @book2 = FactoryGirl.create(:book)
        solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
        solr_books_core.delete_by_query('*:*')
        solr_books_core.commit
        solr_books_core.add({ job_id: 9, language_facet: 'eng',
           bib_id: 'bib_id_1', title_en: @book1.title, author_en: "author_1"})
            solr_books_core.add({ job_id: 20, language_facet: 'eng',
           bib_id: 'bib_id_2', title_en: @book2.title, author_en: "author_2"})
        solr_books_core.commit
        4.times do
          FactoryGirl.create(:annotation, user_id: @owner_user.id,
           anntype: "Note", volume_id: 9)
          FactoryGirl.create(:annotation, user_id: @owner_user.id,
           anntype: "Note", volume_id: 20)
        end
        6.times do
          FactoryGirl.create(:annotation, user_id: @owner_user.id,
           anntype: "Highlight", volume_id: 9)
          FactoryGirl.create(:annotation, user_id: @owner_user.id,
           anntype: "Highlight", volume_id: 20)
        end
      end
      context "success" do
        context "user with annotations" do
          before do
            page.set_rack_session(user_id: @owner_user.id)
            visit user_path(id: @owner_user, tab: "annotations")
          end
          it 'displays annotations title' do
            expect(page).to have_selector("h4", text: I18n.t('annotations.title') )
          end
          it "displays the correct total number" do
            expect(page).to have_selector("span[id='total_number']", text: 20 )
          end
          it 'displays all the anotatted books' do
            expect(page).to have_selector("div[class='annotation clearfix']", count: 2)
          end
          it "displays the tile of each annotated book" do
            expect(page).to have_selector("h4",text: @book1.title)
            expect(page).to have_selector("h4",text: @book2.title)
          end
          it ' displays the correct notes and highlights numbers' do
            expect(page).to have_selector("span[id='notes']", text: 4, count: 2)
            expect(page).to have_selector("span[id='highlights']", text: 6, count: 2)
          end
          it "has a details link for each annotated book" do
             # expect(page).to have_selector("a", text:  I18n.t('common.details'), count: 2)
             expect(page).to have_link(book_path(id:@book1))
          end
        end
        context "user with no annotations" do
          
        end
      end
      context "failure" do
        
      end
    end
  end 
end
