class CompanyProfile < ActiveRecord::Migration[5.0]
  def change
    change_column :company_profiles, :logo, :string
    add_column :company_profiles ,:fiscal_year_id, :integer
  end
end
