FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'password'
    guid Faker::Lorem.characters(16)
    real_name 'real_name'
  end

end
