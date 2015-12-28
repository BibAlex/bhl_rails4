require 'rails_helper'

RSpec.describe Collection, type: :model do
  
  describe Collection, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:collection)).to be_valid
    end
  end  
  
  describe Collection, 'association' do
    it { should have_many(:volumes) }
    it { should have_many(:collection_volumes) }
    it { should have_many(:comments) }
    it { should have_many(:activities).dependent(:destroy) }
    it { should belong_to(:user) }
  end
  
  describe Collection, 'validation' do
    
    it "is invalid without user_id" do
      expect(FactoryGirl.build(:collection, user_id: nil)).to_not be_valid
    end
    
    it "is invalid without title" do
      expect(FactoryGirl.build(:collection, title: nil)).to_not be_valid
    end
    
    it "is invalid with too short title" do
      expect(FactoryGirl.build(:collection, title: 'tit')).to_not be_valid
    end
    
    it "is invalid with too long title" do
      expect(FactoryGirl.build(:collection, title: Faker::Lorem.characters(26))).to_not be_valid
    end
  end
  
  describe "top_collections" do
    
    before do
      user = User.first
      @first_collection = FactoryGirl.create(:collection, title: "first collection", user_id: user.id, is_public: true, rate: 2)
      @second_collection = FactoryGirl.create(:collection, title: "second collection", user_id: user.id, is_public: true, rate: 4)
      @non_public_collection = FactoryGirl.create(:collection, title: "non public collection", user_id: user.id, is_public: false, rate: 5)
      @top_collections = Collection.top
    end
    
    it "returns top collections ordered by rate" do
      expect(@top_collections.first.id).to eq(@second_collection.id)
      expect(@top_collections.last.id).to eq(@first_collection.id)
    end
    
    it "doesn't return non public collections in top collections" do
      expect(@top_collections).not_to include(@non_public_collection.id)
    end
  end
  
end
