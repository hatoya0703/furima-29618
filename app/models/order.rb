class Order < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :destination
  # バリデーション
end
