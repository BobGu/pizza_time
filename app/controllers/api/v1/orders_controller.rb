module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.all
        render json: @orders, status: :ok
      end

      def create
        items = item_creator
        order = Order.new(items: items) 
        if order.save
          render json: order, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private

      def item_creator
        params[:items].map do |item|
          pizza = Pizza.find_by("lower(name) LIKE ?", item["pizza_type"].downcase)
          render json: { errors: "Couldn't find a pizza type in your order" }, status: :not_found unless pizza

          item = Item.new(pizza: pizza, quantity: item["quantity"])
          render json: { errors: item.errors} unless item.save

          item
        end
      end
    end
  end
end
