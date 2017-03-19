class CreateItemGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :item_groups do |t|
      t.string :name
      t.integer :parent_id
      t.string :description

      t.timestamps
    end
  end
end
