class AddVatInCompanyprofiles < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :vat, :decimal, :precision => 3

  end
end
