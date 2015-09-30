require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  
  describe "get_activity_log" do
    
    before(:all) do
      Rails.cache.clear
      user = FactoryGirl.create(:user, active: true, username: "user_activity", email: "user_activity@example.com", guid: "activity")
      collection = FactoryGirl.create(:collection, user: user, title: "new_collection", is_public: true)
      FactoryGirl.create(:activity, activitable_id: collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "create", user_id: user.id, created_at: Time.now)
      FactoryGirl.create(:activity, activitable_id: collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "rate", user_id: user.id, value: 5, created_at: Time.now + 2)
      FactoryGirl.create(:activity, activitable_id: collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "comment", user_id: user.id, value: "good_collection", created_at: Time.now + 3)
    end
    
    before do
      get :get_activity_log
    end
    
    it "loads all activities sorted by created in DESC order" do
      expect(assigns(:activities).first.action).to eq("comment")     
      expect(assigns(:activities).second.action).to eq("rate")
      expect(assigns(:activities).last.action).to eq("create")
    end      
  end
end