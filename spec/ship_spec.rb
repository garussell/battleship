require "./spec/spec_helper"

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#exists" do
    it "exists and has attributes" do
      expect(@cruiser).to be_an_instance_of(Ship)
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
    end
  end

  describe "#health" do
    it "has health" do
      expect(@cruiser.health).to eq(3)
    end
  end

  describe "#sunk?" do
    it "is not sunk by default" do
      expect(@cruiser.sunk?).to be false
    end
  end

  describe "#hit" do
    it "can take hits" do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
      expect(@cruiser.sunk?).to be true
    end
  end
end