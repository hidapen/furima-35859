FactoryBot.define do
  factory :item do
    title { '商品名' }
    description { '説明' }
    category_id { 2 }
    item_status_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    delivery_date_id { 2 }
    cost { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
