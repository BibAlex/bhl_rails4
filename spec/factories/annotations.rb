FactoryGirl.define do
  factory :annotation do
    volume_id Faker::Number.digit
    user_id Faker::Number.digit
    page Faker::Number.digit
    anntype "note"
    text "content"
  end

end
