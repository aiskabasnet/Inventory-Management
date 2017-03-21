class CreateSaleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
