require 'rails_helper'

require_relative '../../lib/bhl/login'

include BHL::Login


RSpec.describe CommentsController, type: :controller do
  
  before(:all) do
    @user = FactoryGirl.create(:user, active: true)
    book = FactoryGirl.create(:book)
    @volume = FactoryGirl.create(:volume, job_id: 1, book_id: book.id)
  end
  
  
  describe "create" do
    
    context "when user is logged in" do
      it "creates new comment" do
        request.env["HTTP_REFERER"] = "/books/#{@volume.job_id}"
        log_in(@user)
        expect(lambda do
          post :create, comment: { commentable_id: @volume.job_id, commentable_type: "volume", text: "comment", user_id: @user.id }
          expect(response).to redirect_to("/books/#{@volume.job_id}")
        end).to change(Comment, :count).by(1)
      end      
    end
    
    context "when user is not logged in" do
      it "renders must login page" do
        post :create, { commentable_id: @volume.job_id, commentable_type: "volume", text: "comment", user_id: @user.id }
        expect(response).to redirect_to(login_users_path)
      end
    end
  end
  
  
  describe "delete" do
    
    before(:each) do      
      @comment = FactoryGirl.create(:comment, commentable_id: @volume.job_id, commentable_type: "volume", text: "comment", user_id: @user.id)
    end
    context "when user is logged in" do
      it "deletes comment" do
        request.env["HTTP_REFERER"] = "/books/#{@volume.job_id}"
        log_in(@user)
        expect(lambda do
          post :delete, { id: @comment.id }
          expect(response).to redirect_to("/books/#{@volume.job_id}")
        end).to change(Comment, :count).by(-1)
      end      
    end
    
    context "when user is not logged in" do
      it "renders must login page" do
        post :delete, { id: @comment.id }
        expect(response).to redirect_to(login_users_path)
      end
    end
  end

end
