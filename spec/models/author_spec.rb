require 'rails_helper'

RSpec.describe Author, type: :model do  
  
  subject { FactoryGirl.build(:author) }
  
  describe Author, 'association' do
    it { should have_many(:book_authors).dependent(:destroy) }
    it { should have_many(:books) }
  end
  
  describe Author, 'validation' do
    it "is invalid without name" do
      expect(FactoryGirl.build(:author, name: nil)).to_not be_valid
    end
  end
  
end
