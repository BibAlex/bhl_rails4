require 'rails_helper'
include BHL::Login
RSpec.describe UserSearchHistoryController, type: :controller do

  describe "#save_query" do
    let(:user)       {FactoryGirl.create(:user, active: true, email: "user@bibalex.org", username: "user", password: User.hash_password("password")) }
    let(:other_user) {FactoryGirl.create(:user, active: true, email: "other_user@bibalex.org", username: "other_user", password: User.hash_password("other_password")) }

    context "not logged user" do
      it "should redirect to login if not logged" do
        get :save_query,query: "_language=english", id: user.id
        expect(response).to redirect_to(login_users_path)
      end
    end
    context "owner user" do
      it "adds query to queries table"do
        log_in(user)
        expect {get :save_query,query: "_language=english", user_id: user.id}.
         to change(Query,:count).by(1)
      end

      it "displays query saved notice" do
        log_in(user)
        get :save_query,{query: "_language=english", user_id: user.id}
        expect(flash[:notice]).to eq(I18n.t 'common.entity_saved', entity: I18n.t('common.search_query'))
      end
    end
  end

  describe "#delete_query" do
     let(:user) {FactoryGirl.create(:user, active: true, email: "user@bibalex.org", username: "user", password: User.hash_password("password")) }
     let(:other_user) {FactoryGirl.create(:user, active: true, email: "other_user@bibalex.org", username: "other_user", password: User.hash_password("other_password")) }

     before do
        @query = FactoryGirl.create(:query, user_id: user.id)
     end

     context "not the owner user" do
      it "should redirect to login if not logged" do
        get :delete_query,user_id: user.id,  id: @query.id
        expect(response).to redirect_to(login_users_path)
      end

      it "should deny access for wrong user" do
        log_in(user)
        get :delete_query, id: other_user.id
        expect(response).to redirect_to(root_path)
      end
     end

     context "owner user" do
      before do
        log_in(user)
      end
      it "removes query from queries table"do
        expect{ get :delete_query, user_id: user.id,  id: @query.id }.
         to change(Query,:count).by(-1)
      end

      it "redirects to users queries" do
        get :delete_query, user_id: user.id,  id: @query.id
        expect(response).to redirect_to(user_path(id: user.id, tab: "queries"))
      end

      it "displays query deleted notice" do
        get :delete_query, user_id: user.id,  id: @query.id
        expect(flash[:notice]).to eq(I18n.t 'common.entity_deleted', entity: I18n.t('common.search_query'))
      end
     end
  end

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
        expect(response).to redirect_to('/')
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
