require 'rails_helper'

RSpec.describe HierarchyEntry, type: :model do
  
  describe HierarchyEntry, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:hierarchy_entry)).to be_valid
    end
  end  
  
  describe HierarchyEntry, 'association' do
    it { should belong_to(:hierarchy) }
  end
end
