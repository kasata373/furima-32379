FactoryBot.define do
  factory :item do
    name              {'名前'}
    product           {'説明'}
    category_id       {1}
    state_id          {1}
    postage_id        {1}
    prefecture_id     {1}
    shipping_date_id  {1}
    price             {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
