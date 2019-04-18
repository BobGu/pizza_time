class Pizza < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :price, numericality: { greater_than:  0 }

  has_many :items
end
