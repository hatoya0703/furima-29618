FactoryBot.define do
  factory :order_destination do
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone         { Faker::PhoneNumber.subscriber_number(length: 11) }
    token         { 'token' }
  end
end
