FactoryGirl.define do
  factory :email_message do
    name Faker::Name.name
    email Faker::Internet.email
    subject 'subject'
    message 'message'
  end

end
