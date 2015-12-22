FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(4..16) } 
    email { Faker::Internet.email }
    password 'password'
    guid Faker::Lorem.characters(16)
    real_name 'real_name'
  end

end
