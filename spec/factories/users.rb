FactoryGirl.define do
  factory :user do
    username 'factory_username'
    email 'factory_email@example.com'
    password 'password'
    guid Faker::Lorem.characters(16)
    real_name 'real_name'
  end

end
