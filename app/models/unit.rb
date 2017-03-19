class Unit < ApplicationRecord
  has_many :items, :dependent => :destroy
  validates :name, presence: true
  validates :print_name, presence: true


end
