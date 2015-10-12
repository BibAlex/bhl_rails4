require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  
  before do
      Rails.cache.clear
      user = FactoryGirl.create(:user, active: true, username: "user_activity", email: "user_activity@example.com", guid: "activity")
      collection = FactoryGirl.create(:collection, user: user, title: "new_collection", is_public: true)
      @collection_create_activity = FactoryGirl.create(:activity, activitable_id: collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "create", user_id: user.id, created_at: Time.now)
      @collection_rate_activity = FactoryGirl.create(:activity, activitable_id: collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "rate", user_id: user.id, value: 5, created_at: Time.now + 2)
      @collection_comment_activity = FactoryGirl.create(:activity, activitable_id: collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "comment", user_id: user.id, value: "good_collection", created_at: Time.now + 3)
      @volume_activity = FactoryGirl.create(:activity, activitable_id: FactoryGirl.create(:volume).id, activitable_type: "volume", activitable_title: "new_volume",
                                    action: "comment", user_id: user.id, value: "good volume", created_at: Time.now + 4)
    end
  
  describe "get_activity_log" do    
    
    before do
      get :get_activity_log
    end
    
    it "returns a 200 ok status" do
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the get_activity_log partial" do
      expect(response).to render_template(partial: "activities/_get_activity_log")
    end
    
    it "loads all activities sorted by created in DESC order" do
      expect(assigns(:activities).first).to eq(@volume_activity)
      expect(assigns(:activities)[1]).to eq(@collection_comment_activity)
      expect(assigns(:activities)[2]).to eq(@collection_rate_activity)
      expect(assigns(:activities).last).to eq(@collection_create_activity)
    end
  end
  
  describe "index" do  
    
    it "returns a 200 ok status" do
      get :index
      expect(response).to have_http_status(:ok)
    end
    
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
    
    it "returns activities of type collection" do
      get :index, { filter: 'collections', sort: 'DESC' }
      expect(assigns(:activities)).not_to include(@volume_activity)
      expect(assigns(:activities)).to include(@collection_create_activity)
      expect(assigns(:activities)).to include(@collection_rate_activity)
      expect(assigns(:activities)).to include(@collection_comment_activity)
    end
    
    it "returns activities of type comment" do
      get :index, { filter: 'comments', sort: 'DESC' }
      expect(assigns(:activities)).to include(@volume_activity)
      expect(assigns(:activities)).not_to include(@collection_create_activity)
      expect(assigns(:activities)).not_to include(@collection_rate_activity)
      expect(assigns(:activities)).to include(@collection_comment_activity)
    end
    
    it "returns activities of type rate" do
      get :index, { filter: 'rate', sort: 'DESC' }
      expect(assigns(:activities)).not_to include(@volume_activity)
      expect(assigns(:activities)).not_to include(@collection_create_activity)
      expect(assigns(:activities)).to include(@collection_rate_activity)
      expect(assigns(:activities)).not_to include(@collection_comment_activity)
    end
    
  end
end