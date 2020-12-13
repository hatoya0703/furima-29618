class Item < ApplicationRecord
  # ActiveHash拡張記述
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to :status
  belongs_to :delivery_fee_bearer
  belongs_to :sender_area
  belongs_to :shipping_date

  # バリデーション
  with_options presence: true do
    validates :name
    validates :description
    validates :user_id, foreign_key: true
  end
  
  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :delivery_fee_bearer_id
    validates :sender_area_id
    validates :shipping_date_id
  end
end
