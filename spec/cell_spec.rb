require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it 'exists' do

      expect(@cell_1).to be_instance_of(Cell)
      expect(@cell_1.coordinate).to eq("B4")
      expect(@cell_1.ship).to eq(nil)
      expect(@cell_1.empty?).to eq(true)
    end
  end
    it 'can place a ship in a cell' do
      
      @cell_1.place_ship(@cruiser)

      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_1.empty?).to eq(false)
      
    end
end