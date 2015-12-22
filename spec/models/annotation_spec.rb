require 'rails_helper'

RSpec.describe Annotation, type: :model do
  
  describe Annotation, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:annotation)).to be_valid
    end
  end  
  
  describe Annotation, 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:volume) }
  end
  
  describe Annotation, 'validation' do    
    it "is invalid without volume_id" do
      expect(FactoryGirl.build(:annotation, volume_id: nil)).to_not be_valid
    end
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:annotation, user_id: nil)).to_not be_valid
    end    
    
    it "is invalid without anntype" do
      expect(FactoryGirl.build(:annotation, anntype: nil)).to_not be_valid
    end    
  end      
end
