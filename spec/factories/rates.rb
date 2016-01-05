FactoryGirl.define do
  factory :rate do
    user_id Faker::Number.digit
    rateable_id Faker::Number.digit
    rateable_type "collection"
  end

end
