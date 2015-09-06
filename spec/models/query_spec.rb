require 'rails_helper'

RSpec.describe Query, type: :model do
  
  describe Query, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:query)).to be_valid
    end
  end  
  
  describe Query, 'association' do
    it { should belong_to(:user) }
  end
  
  describe Query, 'validation' do
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:query, user_id: nil)).to_not be_valid
    end
  end  
end
