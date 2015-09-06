require 'rails_helper'

RSpec.describe BookLocation, type: :model do
  
  describe BookLocation, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:book_location)).to be_valid
    end
  end  
  
  describe BookLocation, 'association' do
    it { should belong_to(:location) }
    it { should belong_to(:book) }
  end
  
  describe BookLocation, 'validation' do
    
    it "is invalid without book_id" do
      expect(FactoryGirl.build(:book_location, book_id: nil)).to_not be_valid
    end
    
    it "is invalid without location_id" do
      expect(FactoryGirl.build(:book_location, location_id: nil)).to_not be_valid
    end    
  end
end
