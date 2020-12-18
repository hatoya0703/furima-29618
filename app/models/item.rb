class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_bearer
  belongs_to :sender_area
  belongs_to :shipping_date

  # バリデーション
  with_options presence: true do
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :user_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_bearer_id
    validates :sender_area_id
    validates :shipping_date_id
  end
end
