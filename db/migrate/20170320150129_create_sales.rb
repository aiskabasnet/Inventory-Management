class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.date :date
      t.integer :bill_number
      t.decimal :discount
      t.decimal :total
      t.integer :customer_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
