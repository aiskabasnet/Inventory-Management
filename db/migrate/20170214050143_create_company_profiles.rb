class CreateCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :address
      t.string :vdc_mun
      t.integer :ward_no
      t.string :phone_number
      t.integer :vat_pan_no
      t.binary :logo
      t.string :district
      t.string :zone

      t.timestamps
    end
  end
end
