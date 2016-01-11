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
  
  it 'Should get entries for the first hierarchy' do
    hierarchy = hierarchies = Hierarchy.where(browsable: 1).first
    entries = HierarchyEntry.find_siblings(hierarchy.id, 0)
    expect(entries.count).to be > 0
  end
end
