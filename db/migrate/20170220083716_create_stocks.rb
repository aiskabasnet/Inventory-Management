class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :item_id
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :est_sell_price

      t.timestamps
    end
  end
end
