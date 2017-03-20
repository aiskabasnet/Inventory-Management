class AddFiscalYears < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :fiscal_year_id, :integer
  end
end
