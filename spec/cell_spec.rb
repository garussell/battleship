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

  describe "#ship empty?" do
    it 'can place a ship in a cell' do
      
      @cell_1.place_ship(@cruiser)

      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_1.empty?).to eq(false)
    end
  end

  describe "#fire_upon" do
    it 'can be fired upon' do
      @cell_1.place_ship(@cruiser)

      expect(@cell_1.fired_upon?).to be(false)

      @cell_1.fire_upon

      expect(@cell_1.ship.health).to eq(2)
      expect(@cell_1.fired_upon?).to be(true)
    end
  end

  describe "#render" do
# hide the ship
    it 'can render cells as string to print board' do
      expect(@cell_1.render).to eq(".")
      @cell_1.fire_upon
      expect(@cell_1.render).to eq("M")
      
      @cell_2.place_ship(@cruiser)
      expect(@cell_2.render).to eq(".")
# show the ship
      expect(@cell_2.render(true)).to eq("S")
      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
    end
  end

  describe "#sunk?" do
    it 'can sink a ship and place an X' do
      @cell_2.place_ship(@cruiser)
      expect(@cruiser.sunk?).to eq(false)

      @cell_2.fire_upon
      @cruiser.hit
      @cruiser.hit

      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq("X")
    end
  end
end