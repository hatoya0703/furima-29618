class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 },
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }
  validates :first_name, presence: true,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :last_name, presence: true,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :kana_first_name, presence: true,
            format: { with: /\A[ァ-ヶ]+\z/ }
  validates :kana_last_name, presence: true,
            format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birth_date, presence: true
end
