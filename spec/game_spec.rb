require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@game).to be_a(Game)
    end
  end

  # further testing: use runner.rb
end