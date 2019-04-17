require 'rails_helper'

describe Item do
  describe "validations" do
    it { should validate_numericality_of(:quantity) }
  end

  describe "relationships" do
    it { should belong_to(:pizza) }
  end
end
