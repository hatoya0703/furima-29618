FactoryBot.define do
  factory :item do
    name                   { Faker::Commerce.product_name }
    description            { Faker::Lorem.characters }
    category_id            { Faker::Number.between(from: 2, to: 10) }
    price                  { Faker::Number.between(from: 333, to: 9_999_999) }
    status_id              { Faker::Number.between(from: 2, to: 6) }
    delivery_fee_bearer_id { Faker::Number.between(from: 2, to: 7) }
    sender_area_id         { Faker::Number.between(from: 2, to: 10) }
    shipping_date_id       { Faker::Number.between(from: 2, to: 6) }
    association :user
  end
end
