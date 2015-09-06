require 'rails_helper'

RSpec.describe VolumeRating, type: :model do
  
  describe VolumeRating, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:volume_rating)).to be_valid
    end
  end  
  
  describe VolumeRating, 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:volume) }
  end
  
  describe VolumeRating, 'validation' do
    
    it "is invalid without rate" do
      expect(FactoryGirl.build(:volume_rating, rate: nil)).to_not be_valid
    end
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:volume_rating, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without volume_id" do
      expect(FactoryGirl.build(:volume_rating, volume_id: nil)).to_not be_valid
    end    
  end
end
