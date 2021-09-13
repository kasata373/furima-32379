class User < ApplicationRecord
  has_many :items
  has_many :purchases
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password
    validates :surname
    validates :name
    validates :surname_kana
    validates :name_kana
    validates :birthday

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
      validates :password

      with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
       validates :surname
       validates :name

       with_options format: { with: /\A[ァ-ヶー]+\z/ } do
        validates :surname_kana
        validates :name_kana
       end
      end
    end
  end
end
