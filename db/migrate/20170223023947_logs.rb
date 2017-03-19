class Logs < ActiveRecord::Migration[5.0]
  def change
    change_column :logs, :user_id, :string
  end
end
