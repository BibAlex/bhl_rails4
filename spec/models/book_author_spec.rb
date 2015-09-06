require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  
  describe BookAuthor, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:book_author)).to be_valid
    end
  end  
  
  describe BookAuthor, 'association' do
    it { should belong_to(:author) }
    it { should belong_to(:book) }
  end
  
  describe BookAuthor, 'validation' do
    
    it "is invalid without book_id" do
      expect(FactoryGirl.build(:book_author, book_id: nil)).to_not be_valid
    end
    
    it "is invalid without author_id" do
      expect(FactoryGirl.build(:book_author, author_id: nil)).to_not be_valid
    end    
  end
end
