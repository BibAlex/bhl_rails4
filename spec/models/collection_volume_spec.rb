require 'rails_helper'

RSpec.describe CollectionVolume, type: :model do
  
  describe CollectionVolume, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:collection_volume)).to be_valid
    end
  end
  
  subject { FactoryGirl.build(:collection_volume) }
  
  describe CollectionVolume, 'association' do
    it { should belong_to(:collection) }
    it { should belong_to(:volume) }
  end
  
  describe CollectionVolume, 'validation' do
    
    it "is invalid without collection_id" do
      expect(FactoryGirl.build(:collection_volume, collection_id: nil)).to_not be_valid
    end
    
    it "is invalid without volume_id" do
      expect(FactoryGirl.build(:collection_volume, volume_id: nil)).to_not be_valid
    end    
  end
end
