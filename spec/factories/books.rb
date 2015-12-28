FactoryGirl.define do
  factory :book do
    sequence(:title, 100) {|n| "#{Faker::Name.name}_#{n}" }
  end

end
