require 'rails_helper'

describe Api::V1::OrdersController do
  describe "GET index" do
    let(:item_1) { create(:item, quantity: 2) }
    let(:item_2) { create(:item, quantity: 1) }
    let!(:order_1) { create(:order, items: [item_1, item_2]) }
    let(:expected_response) do
      [
        { "total_price" => "2.97", "items" =>
          [
            {
              "quantity" => item_1.quantity,
              "pizza_name" => item_1.pizza.name,
              "pizza_id" => item_1.pizza.id
            },
            {
              "quantity" => item_2.quantity,
              "pizza_name" => item_2.pizza.name,
              "pizza_id" => item_2.pizza.id
            }
          ]
      }
      ]
    end

    it "should return a list of orders with their total prices" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end

  describe "POST create" do
    before do
      create(:pizza, name: "Cheese")
      create(:pizza, name: "veggie")
    end
    let(:order_params) do
      {
        "items" =>
        [
          {
            pizza_type: "cheese",
            quantity: 2
          },
          {
            pizza_type: "veggie",
            quantity: 1
          }
        ]
      }
    end

    let(:expected_response) do
      { "total_price" => "2.97", "items" =>
        [
          {
            "quantity" => 2,
            "pizza_name" => "Cheese",
            "pizza_id" => Pizza.first.id
          },
          {
            "quantity" => 1,
            "pizza_name" => "veggie",
            "pizza_id" => Pizza.last.id
          }
        ]
      }
    end

    context "the pizza types exist" do
      it "creates the order" do
        post :create, params: order_params
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to eq(expected_response)
      end
    end
  end
end
