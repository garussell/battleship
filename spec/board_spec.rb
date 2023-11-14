require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @small_board = Board.new(4)
    @large_board = Board.new(10)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe '#initialize' do 
    it 'exists and has attributes' do
      expect(@small_board.board_size).to eq(4)
      expect(@large_board.board_size).to eq(10)
      expect(@small_board).to be_instance_of(Board)
      expect(@small_board.cells.count).to eq(16)
      expect(@small_board.cells).to be_a(Hash)
    end
  end

  describe '#create_cells' do
    it 'creates cells' do
      rendered_cells = @small_board.create_cells
      expect(rendered_cells).to be_a(Hash)
      expect(rendered_cells.count).to eq(16)
      expect(rendered_cells["A1"]).to be_a(Cell)
      expect(rendered_cells["A1"].coordinate).to eq("A1")
      expect(rendered_cells["D4"]).to be_a(Cell)
      expect(rendered_cells["D4"].coordinate).to eq("D4")
    end
  end

  describe '#valid_coordinate?' do
    it 'can recognize valid coordinates' do
      expect(@small_board.valid_coordinate?("A1")).to eq(true)
      expect(@small_board.valid_coordinate?("D4")).to eq(true)
      expect(@small_board.valid_coordinate?("A5")).to eq(false)
      expect(@small_board.valid_coordinate?("E1")).to eq(false)
      expect(@small_board.valid_coordinate?("A22")).to eq(false)

      expect(@large_board.valid_coordinate?("A1")).to eq(true)
      expect(@large_board.valid_coordinate?("J10")).to eq(true)
      expect(@large_board.valid_coordinate?("A11")).to eq(false)
      expect(@large_board.valid_coordinate?("K1")).to eq(false)
      expect(@large_board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it 'can validate placements' do
      expect(@small_board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@small_board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@small_board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@small_board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@small_board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)

      expect(@large_board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@large_board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@large_board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@large_board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@large_board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
    end
  end

  describe '#place(ship, coordinates)' do
    it 'can place ship on cell' do
      @small_board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @small_board.cells["A1"]
      cell_2 = @small_board.cells["A2"]
      cell_3 = @small_board.cells["A3"]
      cell_4 = @small_board.cells["D4"]

      expect(cell_1.ship).to be_a(Ship)
      expect(cell_2.ship).to be_a(Ship)
      expect(cell_3.ship).to be_a(Ship)
      expect(cell_3.ship == cell_2.ship).to eq(true)
      expect(cell_2.ship == cell_1.ship).to eq(true)
      expect(cell_4.ship == cell_3.ship).to eq(false)
    end

    it 'cannot place ship on occupied cell' do
      @small_board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@small_board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end
  
  describe '#renders board' do
    it 'renders the boards' do

      @small_board.place(@cruiser, ["A1", "A2", "A3"])

      expect(@small_board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(@small_board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end