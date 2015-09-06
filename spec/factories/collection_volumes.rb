FactoryGirl.define do
  factory :collection_volume do
    volume_id Faker::Number.digit
    collection_id Faker::Number.digit
  end

end
