FactoryGirl.define do
  factory :book_subject do
    book_id Faker::Number.digit
    subject_id Faker::Number.digit
  end

end
