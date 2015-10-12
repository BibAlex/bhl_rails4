require 'rails_helper'

RSpec.describe Activity, type: :model do
  
  describe Activity, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:activity)).to be_valid
    end
  end
  
  subject { FactoryGirl.build(:activity) }
  
  describe Activity, 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:activitable) }
  end
  
  describe Activity, 'validation' do
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:activity, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without activitable_id" do
      expect(FactoryGirl.build(:activity, activitable_id: nil)).to_not be_valid
    end
    
    it "is invalid without activitable_type" do
      expect(FactoryGirl.build(:activity, activitable_type: nil)).to_not be_valid
    end
    
    it "is invalid without action" do
      expect(FactoryGirl.build(:activity, action: nil)).to_not be_valid
    end    
  end
  
  describe "filter_activities" do
    
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
    
    it "returns activities of type collection" do
      activities = Activity.filter__and_sort_activities('collections', 'DESC', 1)
      expect(activities).not_to include(@volume_activity)
      expect(activities).to include(@collection_create_activity)
      expect(activities).to include(@collection_rate_activity)
      expect(activities).to include(@collection_comment_activity)
    end
    
    it "returns activities of type comment" do
      activities = Activity.filter__and_sort_activities('comments', 'DESC', 1)
      expect(activities).to include(@volume_activity)
      expect(activities).not_to include(@collection_create_activity)
      expect(activities).not_to include(@collection_rate_activity)
      expect(activities).to include(@collection_comment_activity)
    end
    
    it "returns activities of type rate" do
      activities = Activity.filter__and_sort_activities('rate', 'DESC', 1)
      expect(activities).not_to include(@volume_activity)
      expect(activities).not_to include(@collection_create_activity)
      expect(activities).to include(@collection_rate_activity)
      expect(activities).not_to include(@collection_comment_activity)
    end
    
  end
end