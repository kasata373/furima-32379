class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { maximum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :encrypted_password, presence: true, confirmation: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name, presence: true,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ } 
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birthday, presence: true

end
