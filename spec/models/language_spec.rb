require 'rails_helper'

RSpec.describe Language, type: :model do
  
  describe Language, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:language)).to be_valid
    end
  end  
  
  describe Language, 'association' do
    it { should have_many(:book_languages).dependent(:destroy) }
    it { should have_many(:books) }
  end
  
  describe Language, 'validation' do
    
    it "is invalid without code" do
      expect(FactoryGirl.build(:language, code: nil)).to_not be_valid
    end

    # These specs are no longer valid as the length constraint has been removed from the model
    #it "is invalid with too short code" do
      #expect(FactoryGirl.build(:language, code: 'co')).to_not be_valid
    #end
    
    #it "is invalid with too long code" do
    #  #expect(FactoryGirl.build(:language, code: Faker::Lorem.characters(4))).to_not be_valid
    #end
  end
end
