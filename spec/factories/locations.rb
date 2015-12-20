FactoryGirl.define do
  factory :location do
    formatted_address Faker::Address.city
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    country_id Faker::Address.country_code
  end
end
