require 'rails_helper'

RSpec.describe Subject, type: :model do
  
  describe Subject, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:subject)).to be_valid
    end
  end  
  
  describe Subject, 'association' do
    it { should have_many(:book_subjects).dependent(:destroy) }
    it { should have_many(:books) }
  end
  
  describe Subject, 'validation' do
    
    it "is invalid without name" do
      expect(FactoryGirl.build(:subject, name: nil)).to_not be_valid
    end
  end
end
