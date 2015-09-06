FactoryGirl.define do
  factory :volume_rating do
    user_id Faker::Number.digit
    volume_id Faker::Number.digit
  end

end
