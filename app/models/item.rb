class Item < ApplicationRecord
  belongs_to :item_group
  belongs_to :unit
  belongs_to :fiscal_year
  has_one :stock, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :stock
  validates :name, presence: true
  validates :item_code, presence: true
  validates :unit_id, presence: true
  validates :item_group_id, presence: true
  validates :name, presence: true
  has_one :stock,inverse_of: :item, :dependent => :destroy
  accepts_nested_attributes_for :stock
  has_many :purchase_items
  has_many :sale_items
  def self.search(search)
    if search
     where('name LIKE ?', "%#{search}%")
    else
      all
    end
end
end
