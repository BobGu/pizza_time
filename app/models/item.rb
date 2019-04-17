class Item < ActiveRecord::Base
  validates :quantity, numericality: { greater_than:  0 }

  belongs_to :pizza
end
