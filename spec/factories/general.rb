FactoryBot.define do
  factory :general do
    
    user_id             {1}
    item_id             {1}
    postal_code         {'123-4567'}
    prefecture_id       {1}
    municipal_district  {'bb町'}
    address             {'番地1-1-1'}
    building_name       {'aaaビル'}
    phone_number        {'09012345678'}
    token               {'tok_abcdefghijk00000000000000000'}
    
  end
end
