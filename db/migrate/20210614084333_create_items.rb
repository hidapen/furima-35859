class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,              null: false
      t.text       :description,        null: false
      t.integer    :category_id,        null: false
      t.integer    :item_status_id,     null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :delivery_date_id,   null: false
      t.integer    :cost,               null: false
      t.references :user,               null: false, foreign_key: true
      t.text       :text,               null: false
      t.integer    :genre_id,           null: false
      t.timestamps
    end
  end
end
