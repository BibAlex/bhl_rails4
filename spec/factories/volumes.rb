FactoryGirl.define do
  factory :volume do
    book_id Faker::Number.digit
    job_id Faker::Number.digit
  end

end
