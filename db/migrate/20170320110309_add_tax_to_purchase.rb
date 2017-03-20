class AddTaxToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :vat, :decimal, precision: 10, scale: 2
  end
end
