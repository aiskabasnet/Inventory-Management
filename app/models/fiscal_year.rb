class FiscalYear < ApplicationRecord
  has_one :company_profile
  has_one :item
end
