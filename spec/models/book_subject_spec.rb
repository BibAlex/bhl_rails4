require 'rails_helper'

RSpec.describe BookSubject, type: :model do
  
  describe BookSubject, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:book_subject)).to be_valid
    end
  end
  
  subject { FactoryGirl.build(:book_subject) }
  
  describe BookSubject, 'association' do
    it { should belong_to(:book) }
    it { should belong_to(:subject) }
  end
  
  describe BookSubject, 'validation' do
    
    it "is invalid without book_id" do
      expect(FactoryGirl.build(:book_subject, book_id: nil)).to_not be_valid
    end
    
    it "is invalid without subject_id" do
      expect(FactoryGirl.build(:book_subject, subject_id: nil)).to_not be_valid
    end
    
  end
end
