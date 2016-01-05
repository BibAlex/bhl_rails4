require 'rails_helper'

RSpec.describe Hierarchy, type: :model do
  
  describe Hierarchy, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:hierarchy)).to be_valid
    end
  end  
  
  describe Hierarchy, 'association' do
    it { should have_many(:hierarchy_entries) }
  end
  
  it 'Should get browsable hierarchies' do
    hierarchies = Hierarchy.where(browsable: 1)
    expect(hierarchies.count).to be > 0
  end
end
