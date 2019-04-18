module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.all
        render json: @orders, status: :ok
      end
    end
  end
end