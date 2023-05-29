require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe '#initialize' do 
    it 'exists' do
      expect(@board).to be_instance_of(Board)
      expect(@board.cells.count).to eq(16)
      expect(@board.cells).to be_a Hash
      expect(@board.cells["A1"]).to be_a(Cell)
      expect(@board.cells["C3"]).to be_a(Cell)
      expect(@board.cells["D2"]).to be_a(Cell)
      expect(@board.cells["A4"].coordinate).to eq("A4")
    end
  end
  describe '#validations' do
    it 'can recognize valid coordinates' do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end

    it 'can validate placements' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end
  end

  describe '#place(ship, coordinates)' do
    it 'can place ship on cell' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]
      cell_4 = @board.cells["D4"]

      expect(cell_1.ship).to be_a(Ship)
      expect(cell_2.ship).to be_a(Ship)
      expect(cell_3.ship).to be_a(Ship)
      expect(cell_3.ship == cell_2.ship).to eq(true)
      expect(cell_2.ship == cell_1.ship).to eq(true)
      expect(cell_4.ship == cell_3.ship).to eq(false)
    end

    it 'cannot place ship on occupied cell' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end
  
  describe '#renders board' do
    it 'renders the boards' do

      @board.place(@cruiser, ["A1", "A2", "A3"])

      expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end