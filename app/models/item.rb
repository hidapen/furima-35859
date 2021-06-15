class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :item_status_id
  validates :delivery_charge_id
  validates :prefecture_id
  validates :delivery_date_id
  end

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :cost
    validates :user
    validates :text
  end
end
