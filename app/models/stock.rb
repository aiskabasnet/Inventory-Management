class Stock < ApplicationRecord
  belongs_to :item, inverse_of: :stock
end
