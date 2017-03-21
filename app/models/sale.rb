class Sale < ApplicationRecord
  has_many :sale_items, :dependent => :destroy
  accepts_nested_attributes_for :sale_items, :allow_destroy => true
  belongs_to :customer
  has_one :company_profile
  belongs_to :fiscal_year
end
