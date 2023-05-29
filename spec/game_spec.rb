require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@game).to be_a(Game)
      expect(@game.menu).to eq("Welcome to BATTLESHIP  Enter p to play.  Enter q to quit")
    end
  end

  # further testing: use runner.rb
end