require 'rails_helper'

RSpec.describe Collection, type: :model do
  
  describe Collection, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:collection)).to be_valid
    end
  end  
  
  describe Collection, 'association' do
    it { should have_many(:volumes) }
    it { should have_many(:collection_volumes) }
    it { should have_many(:collection_ratings) }
    it { should have_many(:comments) }
    it { should have_many(:activities).dependent(:destroy) }
    it { should belong_to(:user) }
  end
  
  describe Collection, 'validation' do
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:collection, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without title" do
      expect(FactoryGirl.build(:collection, title: nil)).to_not be_valid
    end
    
    it "is invalid with too short title" do
      expect(FactoryGirl.build(:collection, title: 'tit')).to_not be_valid
    end
    
    it "is invalid with too long title" do
      expect(FactoryGirl.build(:collection, title: Faker::Lorem.characters(26))).to_not be_valid
    end
  end
  
end
