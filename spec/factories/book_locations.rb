FactoryGirl.define do
  factory :book_location do
    book_id Faker::Number.digit
    location_id Faker::Number.digit
  end

end
