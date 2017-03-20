class AddSupplierId < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :supplier_id, :integer
  end
end
