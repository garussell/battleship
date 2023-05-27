require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @board = Board.new
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
end