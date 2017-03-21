class ChangeUnitPrice < ActiveRecord::Migration[5.0]
  def change
    change_column :stocks, :unit_price, :decimal, :precision => 3
  end
end
