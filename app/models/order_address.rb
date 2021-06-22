class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:municipality,:house_number,:building_name,:phone_number,:user_id,:item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code   ,format: {with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンを含めてください"}
    validates :prefecture_id ,numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number  ,format: {with: /\A\d{10,11}\z/}
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,house_number: house_number,building_name: building_name,phone_number: phone_number)
  end
end

