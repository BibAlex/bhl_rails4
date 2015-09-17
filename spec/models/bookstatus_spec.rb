require 'rails_helper'

RSpec.describe Bookstatus, type: :model do
  
  describe Bookstatus, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:bookstatus)).to be_valid
    end
  end  
  
  describe Bookstatus, 'association' do
    it { should have_many(:books) }
  end
  
  describe Bookstatus, 'validation' do
    
    it "is invalid without code" do
      expect(FactoryGirl.build(:bookstatus, code: nil)).to_not be_valid
    end
    
    it "is invalid with duplicate code" do
      FactoryGirl.create(:bookstatus, code: '10')
      expect(FactoryGirl.build(:bookstatus, code: '10')).to_not be_valid
    end
    
    it "is invalid with too short code" do
      expect(FactoryGirl.build(:bookstatus, code: 'code_1')).to_not be_valid
    end
    
    it "is invalid with too long code" do
      expect(FactoryGirl.build(:bookstatus, code: 'c')).to_not be_valid
    end    
  end
end
