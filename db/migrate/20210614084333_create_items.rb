class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :item_status_id
      t.integer :delivery_charge_id
      t.integer :prefecture_id
      t.integer :delivery_date_id
      t.integer :cost
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
