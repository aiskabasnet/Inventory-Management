class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :unit_id
      t.integer :item_code
      t.integer :item_group_id
      t.references :item_group, index:true
      t.string :description
      t.timestamps
    end
  end
end
