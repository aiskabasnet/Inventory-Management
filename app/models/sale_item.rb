class SaleItem < ApplicationRecord
  belongs_to :sale, required: false
  belongs_to :item
end
