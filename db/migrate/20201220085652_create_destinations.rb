class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string  :city, null: false
      t.string  :house_number, null: false
      t.string  :building
      t.string  :phone, null: false
      t.integer :order_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
