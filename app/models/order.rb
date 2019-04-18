class Order < ActiveRecord::Base
  include ActiveModel::Serialization
  has_many :items

  def total_price
    items.reduce(0) { |accumulator, item| accumulator + item.quantity * item.pizza.price }
  end
end
