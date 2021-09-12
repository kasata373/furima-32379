class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :name
    validates :product
    validates :price
    validates :image

    with_options numericality: { only_integer: true, greater_than: 300, less_than: 9999999} do
      validates :price
    end

     with_options numericality: { other_than: 0, message: "can't be blank" } do
       validates :category_id
       validates :state_id
       validates :postage_id
       validates :prefecture_id
       validates :shipping_date_id
     end

   end

  def was_attached?
    self.image.attached?
  end
end

