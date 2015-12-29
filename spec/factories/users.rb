FactoryGirl.define do
  factory :user do
    sequence(:username, 1) { |n| "username_#{n}" }
    sequence(:email, 1) {|n| "email_#{n}@example.com" }
    password 'password'
    guid Faker::Lorem.characters(16)
    sequence(:real_name, 1) { |n| "real name #{n}" }
  end

end
