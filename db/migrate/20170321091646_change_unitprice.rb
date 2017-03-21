class ChangeUnitprice < ActiveRecord::Migration[5.0]
  def change
    change_column :stocks, :unit_price, :decimal, precision: 5, scale: 2
  end
end
