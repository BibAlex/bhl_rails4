require 'rails_helper'

RSpec.describe UserVolumeHistory, type: :model do
  
  describe UserVolumeHistory, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:user_volume_history)).to be_valid
    end
  end
  
  subject { FactoryGirl.build(:user_volume_history) }
  
  describe UserVolumeHistory, 'association' do
    it { should belong_to(:volume) }
    it { should belong_to(:user) }
  end
  
  describe UserVolumeHistory, 'validation' do
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:user_volume_history, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without volume_id" do
      expect(FactoryGirl.build(:user_volume_history, volume_id: nil)).to_not be_valid
    end    
  end
end
