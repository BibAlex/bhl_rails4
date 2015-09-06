FactoryGirl.define do
  factory :book_author do
    book_id Faker::Number.digit
    author_id Faker::Number.digit
  end

end
