class Pizza < ActiveRecord::Base
  validates :name, presence: true
  validates :price, numericality: { greater_than:  0 }

  has_many :items
end
