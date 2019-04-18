require 'rails_helper'

describe Pizza do
  describe "validations" do
    subject { create(:pizza) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_numericality_of(:price) }
  end

  describe "relationships" do
    it { should have_many(:items) }
  end
end
