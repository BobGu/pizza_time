require 'rails_helper'

describe Pizza do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:price) }
  end

  describe "relationships" do
    it { should have_many(:items) }
  end
end
