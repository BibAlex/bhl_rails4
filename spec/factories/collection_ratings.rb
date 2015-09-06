FactoryGirl.define do
  factory :collection_rating do
    user_id Faker::Number.digit
    collection_id Faker::Number.digit
    rate 5
  end

end
