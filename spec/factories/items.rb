FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '商品の説明' }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 1_000_000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
