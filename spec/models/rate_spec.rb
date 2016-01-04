require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe Rate, 'FactoryGirl' do
    let(:rate) {FactoryGirl.build(:rate)}
    it 'has a valid factory' do
      expect(rate).to be_valid
    end
    it "triggers update_activity on save" do
      expect(rate).to receive(:update_activity)
      rate.save
    end
  end  
  
  describe Rate, 'association' do
    it { should belong_to(:user) }
  end
  
  describe Rate, 'validation' do
    
    it "is invalid without rate" do
      expect(FactoryGirl.build(:rate, rate: nil)).to_not be_valid
    end
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:rate, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without rateable_id" do
      expect(FactoryGirl.build(:rate, rateable_id: nil)).to_not be_valid
    end
    
    it "is invalid without rateable_type" do
      expect(FactoryGirl.build(:rate, rateable_type: nil)).to_not be_valid
    end
  end
end
