class General
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipal_district, :address, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is valid." }
    validates :municipal_district
    validates :address
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ , message: "is valid." }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    delivery = Delivery.create(postal_code: postal_code,prefecture_id: prefecture_id, municipal_district: municipal_district, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end