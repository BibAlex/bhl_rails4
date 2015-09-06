FactoryGirl.define do
  factory :comment do
    commentable_id Faker::Number.digit
    text "comment"
  end

end
