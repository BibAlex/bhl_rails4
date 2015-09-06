FactoryGirl.define do
  factory :book_language do
    book_id Faker::Number.digit
    language_id Faker::Number.digit
  end

end
