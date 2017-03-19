class PurchaseItem < ApplicationRecord
  belongs_to :purchase, required: false
  belongs_to :item
end
