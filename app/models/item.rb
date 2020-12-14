class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # バリデーション
  
end
