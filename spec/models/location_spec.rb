require 'rails_helper'

RSpec.describe Location, type: :model do
  
  describe Location, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:location)).to be_valid
    end
  end  
  
  describe Location, 'association' do
    it { should have_many(:book_locations).dependent(:destroy) }
    it { should have_many(:books) }
    it { should belong_to(:country) }
  end  
end
