FactoryBot.define do
  factory :location do
    address { Faker::Address.street_address }
    description { Faker::Address.street_name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
