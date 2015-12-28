require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  

  describe "#new" do
    
    before do
      get :new
    end
    
    it "returns a 200 ok status" do
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    
    context "when user enters valid parameters" do
      
      it "creates new user" do
         expect {
          post :create, { user: { username: "user", entered_password: "password", entered_password_confirmation: "password", 
                                  email: "user@example.com", email_confirmation: "user@example.com", real_name: "user" } }
         }.to change(User, :count).by(1)
      end
      
      it "redirects to home page" do
        post :create, { user: { username: "user", entered_password: "password", entered_password_confirmation: "password", 
                                email: "user@example.com", email_confirmation: "user@example.com", real_name: "user" } }
        expect(response).to redirect_to(root_path)
      end
      
      it "displays a flash message for successful registeration" do
        post :create, { user: { username: "user", entered_password: "password", entered_password_confirmation: "password", 
                                email: "user@example.com", email_confirmation: "user@example.com", real_name: "user" } }
        expect(flash[:notice]).to eq(I18n.t('msgs.registration_welcome_message', real_name: "user"))
      end
      
      it "uploads custom user photo" do
        file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                      filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
        post :create, { user: { username: "user", entered_password: "password", entered_password_confirmation: "password", 
                                email: "user@example.com", email_confirmation: "user@example.com", real_name: "user",
                                photo_name: file } }
        expect(File.exist?("#{Rails.root}/public/avatar_#{Rails.env}/users/#{User.last.id}")).to eq(true)
        
        file_path = "#{Rails.root}/public/avatar_#{Rails.env}/users/#{User.last.id}"
        FileUtils.rm_rf(file_path) if File.exist?(file_path)          
      end
    end
    
    context "when user enters invalid parameters" do
      
      it "doesn't create a new user" do
         expect {
          post :create, { user: { username: "", entered_password: "password", entered_password_confirmation: "password", 
                                email: "user@example.com", email_confirmation: "user@example.com", real_name: "user" } }
         }.to change(User, :count).by(0)
      end
      
      it "renders redirects to new page" do
        post :create, { user: { username: "", entered_password: "password", entered_password_confirmation: "password", 
                                email: "user@example.com", email_confirmation: "user@example.com", real_name: "user" } }
        expect(response).to redirect_to(new_user_path)
      end      
    end    
  end
  
  describe "#login" do
    
    before do
      get :login
    end
    
    it "returns a 200 ok status" do
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the login template" do
      expect(response).to render_template(:login)
    end
  end
  
  describe "#show" do 
    
    let!(:owner_user) { FactoryGirl.create(:user, active: true, username: "owner_user", password: User.hash_password("owner_user_password")) }
    
    before do
      session[:user_id] = owner_user.id
      get :show, { id: owner_user.id }
    end
    
    it "returns a 200 ok status" do      
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the show template" do
      expect(response).to render_template(:show)
    end
    
    it "loads user info" do
      expect(assigns(:user)).to eq(owner_user)
    end
    
    it "loads tab info" do
      expect(assigns(:tab)).to eq("profile")
    end

    describe "annotations tab" do
      before do
        @owner_user = FactoryGirl.create(:user, active: true, username: "owneruser",
         password: User.hash_password("owner_user_password"))
        @other_user = FactoryGirl.create(:user, active: true, 
          username: "otheruser", password: User.hash_password("other_user_password"))
      end
      context "successful" do 
        before do
          book = FactoryGirl.create(:book)
          solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
          solr_books_core.delete_by_query('*:*')
          solr_books_core.commit
          solr_books_core.add({ job_id: 9, language_facet: 'eng',
             bib_id: 'bib_id_1', title_en: book.title, author_en: "author_1"})
              solr_books_core.add({ job_id: 20, language_facet: 'eng',
             bib_id: 'bib_id_2', title_en: book.title, author_en: "author_2"})
          solr_books_core.commit
          2.times do
            FactoryGirl.create(:annotation, user_id: @owner_user.id,
             anntype: "Note", volume_id: 9)
            FactoryGirl.create(:annotation, user_id: @owner_user.id,
             anntype: "Note", volume_id: 20)
          end
          3.times do
            FactoryGirl.create(:annotation, user_id: @owner_user.id,
             anntype: "Highlight", volume_id: 9)
            FactoryGirl.create(:annotation, user_id: @owner_user.id,
             anntype: "Highlight", volume_id: 20)
          end
         
        end
        context "with user has annotations" do
          before do
            session[:user_id] = @owner_user.id
            get :show, id: @owner_user.id, tab: "annotations"
          end
           it "loads successfully" do 
            expect(response).to have_http_status(:ok)
          end
          it "loads the rights tab" do
            expect(assigns[:tab]).to eq("annotations")
          end
          it 'displays the right number for total annotations' do
            expect(assigns[:total_number]).to eq(10)
          end
        end
        context "user with no annotations" do
          before do
            session[:user_id] = @other_user.id
            get :show, id: @other_user.id, tab: "annotations"
          end
           it "loads successfully" do 
            expect(response).to have_http_status(:ok)
          end
          it 'assigns zero annotations for the user' do
            expect(assigns[:total_number]).to eq(0)
          end
        end
      end
      context "failure" do
        before do
          session[:user_id] = @other_user.id
          get :show, id: @owner_user.id, tab: "annotations"
        end
        it "doesn't show the annotations tab" do
          expect(response).to redirect_to( user_path(id: @owner_user.id) )
        end
        it 'displays an access denied error' do
          expect(flash[:error]).to eq(I18n.t 'msgs.access_denied_error')
        end
      end
    end
 end

  describe "#logout" do     
      
   let!(:user) { FactoryGirl.create(:user, active: true, username: "user_logout", password: User.hash_password("user_logout_password")) }
    
    before do
      post :validate, { user: { username: "user_logout", password: "user_logout_password" } }
      get :logout, { id: user.id }
    end
    
   
    it "redirects to root path" do
      expect(response).to redirect_to(root_path)
    end
      
    it "clears session of user_id" do       
       expect(session[:user_id]).to be_nil
    end    
  end
  
  describe "#validate" do
    
    context "valid user" do      
      
      let!(:user) { FactoryGirl.create(:user, active: true, username: "valid_user_login", password: User.hash_password("valid_user_login_password")) }
      
      it "sets session of user_id" do
         post :validate, { user: { username: "valid_user_login", password: "valid_user_login_password" } }
         expect(session[:user_id]).to eq(user.id)
      end
      
      it "redirects to the profile page of the user" do
        post :validate, { user: { username: "valid_user_login", password: "valid_user_login_password" } }
        expect(response).to redirect_to(user_path(id: user.id))
      end
      
      it "displays a flash message for successful login" do
        post :validate, { user: { username: "valid_user_login", password: "valid_user_login_password" } }
        expect(flash[:notice]).to eq(I18n.t('msgs.sign_in_successful_notice'))
      end     
    end
    
    context "invalid user" do
      
      it "sets session of login_attempts" do
        last_login_attempts = session[:login_attempts] ||= 0
        post :validate, { user: { username: "invalid_username", password: "invalid_password" } }
        expect(session[:login_attempts]).to eq(last_login_attempts + 1)
      end
      
      it "renders renders login page" do
        post :validate, { user: { username: "invalid_username", password: "invalid_password" } }
        expect(response).to redirect_to(login_users_path)
      end
      
      it "displays a flash message for unsuccessful login" do
        post :validate, { user: { username: "invalid_username", password: "invalid_password" } }
        expect(flash[:error]).to eq(I18n.t('msgs.sign_in_unsuccessful_error'))
      end            
    end    
  end
end