FactoryGirl.define do
  factory :activity do
    user_id Faker::Number.digit
    activitable_id Faker::Number.digit
    activitable_type 'collection'
    action 'create'
  end

end
