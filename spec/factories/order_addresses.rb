FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-0000'}
    prefecture_id { 3 }
    municipality { '札幌市' }
    house_number { '123-456' }
    building_name { 'はなわ壮' }
    phone_number { '09012345678' }
    user_id { '2' }
    item_id { '3' }
  end
end
