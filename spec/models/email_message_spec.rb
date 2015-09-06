require 'rails_helper'

RSpec.describe EmailMessage, type: :model do
  
  describe EmailMessage, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:email_message)).to be_valid
    end
  end
   
  describe EmailMessage, 'validation' do
    it "is invalid without name" do
      expect(FactoryGirl.build(:email_message, name: nil)).to_not be_valid
    end
    
    it "is invalid without email" do
      expect(FactoryGirl.build(:email_message, email: nil)).to_not be_valid
    end
    
    it "is invalid without subject" do
      expect(FactoryGirl.build(:email_message, subject: nil)).to_not be_valid
    end
    
    it "is invalid without message" do
      expect(FactoryGirl.build(:email_message, message: nil)).to_not be_valid
    end
    
    it "has invalid email format" do
      expect(FactoryGirl.build(:email_message, email: 'email')).to_not be_valid
    end
  end
end
