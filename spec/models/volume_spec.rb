require 'rails_helper'

RSpec.describe Volume, type: :model do
  
  describe Volume, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:volume)).to be_valid
    end
  end
  
  subject { FactoryGirl.build(:volume) }
  
  describe Volume, 'association' do
    it { should have_many(:collection_volumes).dependent(:destroy) }
    it { should have_many(:collections) }
    it { should have_many(:user_volume_histories).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:activities).dependent(:destroy) }
    it { should have_many(:volume_ratings).dependent(:destroy) }
    it { should belong_to(:book) }
  end
  
  describe Volume, 'validation' do
    
    it "is invalid without book_id" do
      expect(FactoryGirl.build(:volume, book_id: nil)).to_not be_valid
    end
    
    it "is invalid without job_id" do
      expect(FactoryGirl.build(:volume, job_id: nil)).to_not be_valid
    end    
  end
end
