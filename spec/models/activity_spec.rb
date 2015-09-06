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
end