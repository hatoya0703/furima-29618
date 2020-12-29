FactoryBot.define do
  factory :order do
    association :user
    association :item
  end
end
