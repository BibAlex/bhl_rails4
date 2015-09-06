FactoryGirl.define do
  factory :user_volume_history do
    volume_id Faker::Number.digit
    user_id Faker::Number.digit
  end

end
