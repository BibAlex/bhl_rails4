require 'rails_helper'

RSpec.describe User, type: :model do  
  
  describe User, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end  
  
  describe User, 'association' do
    it { should have_many(:collection_ratings).dependent(:destroy) }
    it { should have_many(:volume_ratings).dependent(:destroy) }
    it { should have_many(:user_volume_histories).dependent(:destroy) }
    it { should have_many(:activities).dependent(:destroy) }
    it { should have_many(:annotations).dependent(:destroy) }
    it { should have_many(:queries).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end
  
  describe User, 'validation' do
    
     it "is invalid without username" do
      expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
    end
    
     it "is invalid with duplicate username" do
      FactoryGirl.create(:user, username: 'user')
      expect(FactoryGirl.build(:user, username: 'user')).to_not be_valid
    end
    
     it "is invalid with too short username" do
      expect(FactoryGirl.build(:user, username: 'usr')).to_not be_valid
    end
    
     it "is invalid with too long username" do
      expect(FactoryGirl.build(:user, username: Faker::Internet.user_name(17))).to_not be_valid
    end
    
     it "is invalid without email" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end
    
     it "is invalid with duplicated email" do
      FactoryGirl.create(:user, email: 'user@example.com')
      expect(FactoryGirl.build(:user, email: 'user@example.com')).to_not be_valid
    end    
    
     it "is invalid without real_name" do
      expect(FactoryGirl.build(:user, real_name: nil)).to_not be_valid
    end    
    
     it "is invalid with duplicated guid" do
      FactoryGirl.create(:user, guid: 'guid')
      expect(FactoryGirl.build(:user, guid: 'guid')).to_not be_valid
    end    
  end
  
  describe '.authenticate' do
    
    context 'invalid authentication parameters' do
      
      it "returns nil for invalid parameters" do
        expect(User.authenticate(nil, nil)).to be_nil
      end      
    end
    
    context 'valid authentication parameters' do
      
      context 'successful authentication' do
        
        it "returns user matcheing username and password" do
          FactoryGirl.create(:user, username: 'user_name', password: User.hash_password('password'), active: true)
          expect(User.authenticate('user_name', 'password')).to_not be_nil
        end  
      end
    
      context 'unsuccessful authentication' do
        
        it "returns nil for not found user" do
          expect(User.authenticate('user', 'password')).to be_nil
        end
      end
    end    
  end
  
  describe '#activate' do    
    
    before do
      @user = FactoryGirl.create(:user)
      @user.activate
    end
    
    it "updates active attribute after activate user" do
      expect(@user.active).to eq(true)
    end
    
    it "updates verified_date attribute after activate user" do
      expect(@user.verified_date).to_not be_nil
    end
    
    it "updates verification_code attribute after activate user" do
      expect(@user.verification_code).to eq("")
    end
    
  end
end
