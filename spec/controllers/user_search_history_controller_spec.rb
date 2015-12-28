require 'rails_helper'

RSpec.describe UserSearchHistoryController, type: :controller do

  describe "#remove_book_history" do
    
    let!(:user) { FactoryGirl.create(:user, active: true, email: "user_email@bibalex.org", username: "user", password: User.hash_password("password")) }
    let!(:another_user) { FactoryGirl.create(:user, active: true, email: "another_user_email@bibalex.org", 
      username: "another_user", password: User.hash_password("another_password")) }
    let!(:user_volume_history) { FactoryGirl.create(:user_volume_history, user_id: user.id, volume_id: FactoryGirl.create(:volume).id) } 
      
    context "not the owner user" do
      it "should redirect to login if not logged" do
        get :remove_book_history, {user_volume_history_id: user_volume_history, user_id: user.id}
        expect(response).to redirect_to(login_users_path)
      end
      
      it "should deny access for wrong user" do
        session[:user_id] = another_user.id
        get :remove_book_history, {user_volume_history_id: user_volume_history, user_id: another_user.id}
        expect(response).to redirect_to(user_path(id: another_user.id, tab: "history"))
      end
    end
    
    context "owner user" do
      it "should delete this record" do
        session[:user_id] = user.id
        get :remove_book_history, {user_volume_history_id: user_volume_history, user_id: user.id}
        expect(flash[:notice]).not_to be_blank
      end
    end
  end
end
