FactoryGirl.define do
  factory :location do
    sequence(:formatted_address, 10) {|n| "#{Faker::Address.city}_#{n}"}
    sequence(:latitude, 10 ) {|n| Faker::Address.latitude  }
    sequence(:longitude, 100) {|n| Faker::Address.longitude }
    sequence(:country_id, 100) {|n| Faker::Address.country_code }
  end
end
