require 'rails_helper'

RSpec.describe Volumestatus, type: :model do
  
  describe Volumestatus, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:volumestatus)).to be_valid
    end
  end  
  
  describe Volumestatus, 'validation' do
    it "is invalid without code" do
      expect(FactoryGirl.build(:volumestatus, code: nil)).to_not be_valid
    end
    
    it "is invalid with duplicated code" do
      FactoryGirl.create(:volumestatus, code: '10')
      expect(FactoryGirl.build(:volumestatus, code: '10')).to_not be_valid
    end
    
    it "is invalid with too short code" do
      expect(FactoryGirl.build(:volumestatus, code: 'c')).to_not be_valid
    end
    
    it "is invalid with too long code" do
      expect(FactoryGirl.build(:volumestatus, code: 'code')).to_not be_valid
    end    
  end
end
