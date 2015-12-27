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
  
  describe "add_activities" do
    before do
      Rails.cache.clear
      user = FactoryGirl.create(:user, active: true, username: "user_activity", email: "user_activity@example.com", guid: "activity")
      book = FactoryGirl.create(:book, title: "new_book")
      volume = FactoryGirl.create(:volume, book_id: book.id)
      comment = FactoryGirl.create(:comment, text: "main_comment")
      @before_count = Activity.count 
      
      @collection_create = FactoryGirl.create(:collection, user_id: user.id, title: "new_collection", is_public: true)
      @collection_comment = FactoryGirl.create(:comment, commentable_id: @collection_create.id,commentable_type: "collection", 
                                     user_id: user.id, text: "Good_Collection")
      @collection_rate = FactoryGirl.create(:rate, user_id: user.id , rateable_id: @collection_create.id , rateable_type: "collection",
                                     rate: 5 )
      @volume_comment = FactoryGirl.create(:comment, commentable_id: volume.job_id,  commentable_type: "volume", user_id: user.id, 
                                     text: "Good_volume")
      @volume_rate = FactoryGirl.create(:rate, user_id: user.id , rateable_id: volume.job_id ,rateable_type: "volume",
                                     rate: 5 )
      @reply_comment = FactoryGirl.create(:comment, commentable_id: comment.id,
                                     commentable_type: "comment", user_id: user.id, text: "Reply")
    end
    
    it "should add a record for collection creation activity" do
      activity = Activity.add_activity({ activitable_id: @collection_create.id, action: "create",
                                         user_id: @collection_create.user_id, activitable_type: "collection", activitable_title: @collection_create.title })
                                         
      expect(Activity.count).not_to eq(@before_count)
      expect(activity).to have_attributes(activitable_id: @collection_create.id, action: "create",
                                         user_id: @collection_create.user_id, activitable_type: "collection", activitable_title: @collection_create.title)
    end
    
    it "should add a record for collection rate" do
      activity = Activity.add_activity({ activitable_id: @collection_rate.rateable_id, action: "rate",
                                         user_id: @collection_rate.user_id, activitable_type: @collection_rate.rateable_type, 
                                         activitable_title: (Collection.find_by_id(@collection_rate.rateable_id)).title,
                                         value: @collection_rate.rate.to_s})
                                         
      expect(Activity.count).not_to eq(@before_count)
      expect(activity).to have_attributes(activitable_id: @collection_rate.rateable_id, action: "rate",
                                         user_id: @collection_rate.user_id, activitable_type: @collection_rate.rateable_type, 
                                         activitable_title: (Collection.find_by_id(@collection_rate.rateable_id)).title,
                                         value: @collection_rate.rate.to_s)
    end
    
    it "should add a record for collection comment" do
    activity = Activity.add_activity({ activitable_id: @collection_comment.commentable_id, action: "comment",
                                         user_id: @collection_comment.user_id, activitable_type: @collection_comment.commentable_type, 
                                         activitable_title: (Collection.find_by_id(@collection_comment.commentable_id).title),
                                         value: @collection_comment.text})
                                         
      expect(Activity.count).not_to eq(@before_count)
      expect(activity).to have_attributes(activitable_id: @collection_comment.commentable_id, action: "comment",
                                         user_id: @collection_comment.user_id, activitable_type: @collection_comment.commentable_type, 
                                         activitable_title: (Collection.find_by_id(@collection_comment.commentable_id).title),
                                          value: @collection_comment.text)  
    end
    it "should add record for volume rate" do
      activity = Activity.add_activity({ activitable_id: @volume_rate.rateable_id, action: "rate",
                                         user_id: @volume_rate.user_id, activitable_type: @volume_rate.rateable_type, 
                                         activitable_title: (Book.find_by_id((Volume.find_by_job_id(@volume_rate.rateable_id).book_id)).title),
                                         value: @volume_rate.rate.to_s})
                                         
      expect(Activity.count).not_to eq(@before_count)
      expect(activity).to have_attributes(activitable_id: @volume_rate.rateable_id, action: "rate",
                                         user_id: @volume_rate.user_id, activitable_type: @volume_rate.rateable_type, 
                                         activitable_title: (Book.find_by_id(Volume.find_by_job_id(@volume_rate.rateable_id).book_id).title),
                                         value: @volume_rate.rate.to_s)
      
    end
    it "should add record for volume comment" do
      activity = Activity.add_activity({ activitable_id: @volume_comment.commentable_id, action: "comment",
                                         user_id: @volume_comment.user_id, activitable_type: @volume_comment.commentable_type, 
                                         activitable_title: (Book.find_by_id((Volume.find_by_job_id(@volume_comment.commentable_id).book_id)).title),
                                         value: @volume_comment.text})
                                         
      expect(Activity.count).not_to eq(@before_count)
      expect(activity).to have_attributes(activitable_id: @volume_comment.commentable_id, action: "comment",
                                         user_id: @volume_comment.user_id, activitable_type: @volume_comment.commentable_type, 
                                         activitable_title: (Book.find_by_id((Volume.find_by_job_id(@volume_comment.commentable_id).book_id)).title),
                                          value: @volume_comment.text)
      
    end
    
    it "should add record for reply to comment" do
    activity = Activity.add_activity({ activitable_id: @reply_comment.commentable_id, action: "comment",
                                         user_id: @reply_comment.user_id, activitable_type: @reply_comment.commentable_type, 
                                         activitable_title: (Comment.find_by_id(@reply_comment.commentable_id).text), value: @reply_comment.text})
                                         
      expect(Activity.count).not_to eq(@before_count)
      expect(activity).to have_attributes(activitable_id: @reply_comment.commentable_id, action: "comment",
                                         user_id: @reply_comment.user_id, activitable_type: @reply_comment.commentable_type, 
                                         activitable_title: (Comment.find_by_id(@reply_comment.commentable_id).text), value: @reply_comment.text)   
    end
 
 end
end 