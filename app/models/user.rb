class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

  # validates :nickname, presence: true
  # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  # validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :name, presence: true,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ } 
  # validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  # validates :birthday, presence: true

end
