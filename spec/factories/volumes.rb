FactoryGirl.define do
  factory :volume do
    book_id Faker::Number.digit
    sequence(:job_id, 100) {|n| "#{Faker::Number.digit}#{n}".to_i }
  end

end
