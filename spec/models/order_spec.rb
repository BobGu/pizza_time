require 'rails_helper'

describe Order do
  describe "relationships" do
    it { should have_many(:items) }
  end
end
