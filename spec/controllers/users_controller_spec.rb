require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "#new" do
    
    before do
      get :new
    end
    
    it "returns a 200 ok status" do
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the get_activity_log partial" do
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
        expect(File.exist?("#{Rails.root}/public/avatar_#{Rails.env}/users/#{User.last.id}/default_user.png")).to eq(true)
        
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

end
