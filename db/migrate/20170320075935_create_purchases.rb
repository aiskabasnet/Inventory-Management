class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :supplier_id
      t.date :date
      t.integer :bill_number
      t.decimal :discount
      t.decimal :total

      t.timestamps
    end
  end
end
