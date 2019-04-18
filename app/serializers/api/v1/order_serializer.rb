module Api
  module V1
    class OrderSerializer < ActiveModel::Serializer
       attributes :total_price,
                  :items

       def total_price
         object.items.reduce(0) { |accumulator, item| accumulator + item.quantity * item.pizza.price }
       end

       def items
         object.items.map do |item|
           {
             quantity: item.quantity,
             pizza_name: item.pizza.name,
             pizza_id: item.pizza.id
           }
         end
       end
    end
  end
end
