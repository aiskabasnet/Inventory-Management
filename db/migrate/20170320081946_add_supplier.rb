class AddSupplier < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchases, :vendor_id, :integer
  end
end
