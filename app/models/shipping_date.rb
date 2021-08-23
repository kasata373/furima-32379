class ShippingDate < ActiveHash::Base
  self.data = [
    {id: 0, name: '--'}, {id: 1, name: '１〜２で発送'}, {id: 2, name: '３〜４で発送'}, {id: 3, name: '５〜６で発送'}
  ]

  include ActiveHash::Associations
  has_many :items
  
end