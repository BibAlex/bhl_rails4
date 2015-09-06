require 'rails_helper'

RSpec.describe CollectionRating, type: :model do
  
  describe CollectionRating, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:collection_rating)).to be_valid
    end
  end  
  
  describe CollectionRating, 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:collection) }
  end
  
  describe CollectionRating, 'validation' do
    
    it "is invalid without rate" do
      expect(FactoryGirl.build(:collection_rating, rate: nil)).to_not be_valid
    end
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:collection_rating, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without collection_id" do
      expect(FactoryGirl.build(:collection_rating, collection_id: nil)).to_not be_valid
    end    
  end
end
