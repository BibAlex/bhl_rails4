FactoryGirl.define do
  factory :collection do
    user_id Faker::Number.digit
    title Faker::Lorem.characters(10)
  end

end
