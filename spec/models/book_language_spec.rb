require 'rails_helper'

RSpec.describe BookLanguage, type: :model do
  
  describe BookLanguage, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:book_language)).to be_valid
    end
  end  
  
  describe BookLanguage, 'association' do
    it { should belong_to(:language) }
    it { should belong_to(:book) }
  end
  
  describe BookLanguage, 'validation' do
    
    it "is invalid without language_id" do
      expect(FactoryGirl.build(:book_language, language_id: nil)).to_not be_valid
    end
    
    it "is invalid without book_id" do
      expect(FactoryGirl.build(:book_language, book_id: nil)).to_not be_valid
    end    
  end
end
