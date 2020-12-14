class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_bearer
  belongs_to :sender_area
  belongs_to :shipping_date

  # バリデーション
  
end
