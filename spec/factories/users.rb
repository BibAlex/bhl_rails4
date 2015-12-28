FactoryGirl.define do
  factory :user do
    sequence(:username, 100) { |n| "factory_username_#{n}" }
    sequence(:email, 100) {|n| "factory_email#{n}@example.com" }
    password 'password'
    guid Faker::Lorem.characters(16)
    sequence(:real_name, 100) { |n| "real name #{n}" }
  end

end
