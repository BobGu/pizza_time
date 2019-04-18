require 'rails_helper'

describe Order do
  describe "relationships" do
    it { should have_many(:items) }
  end

  describe "#total_price" do
    let(:pizza) { create(:pizza, price: 1.00) }
    let(:item) { create(:item, pizza: pizza, quantity: 2) }
    let(:order) { create(:order, items: [item] ) }

    it { expect(order.total_price).to eq(2.00) }
  end
end
