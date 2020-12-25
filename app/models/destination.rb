class Destination < ApplicationRecord
  # アソシエーション
  belongs_to :order
  # バリデーション
end
