require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  describe Comment, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:comment)).to be_valid
    end
  end  
  
  describe Comment, 'association' do
    it { should have_many(:replies) }
    it { should belong_to(:commentable) }
    it { should have_many(:activities).dependent(:destroy) }
    it { should belong_to(:user) }
  end
  
  describe Comment, 'validation' do
    
    it "is invalid without text" do
      expect(FactoryGirl.build(:comment, text: nil)).to_not be_valid
    end
    
    it "is invalid without commentable_id" do
      expect(FactoryGirl.build(:comment, commentable_id: nil)).to_not be_valid
    end    
  end
end
