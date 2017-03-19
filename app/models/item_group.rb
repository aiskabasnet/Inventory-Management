class ItemGroup < ApplicationRecord
  has_many :items, :dependent => :destroy
  has_many :item_groups
  validates :name, presence: true
end
