class Game
  attr_reader :menu

  def initialize
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @computer_board = Board.new
    @human_board = Board.new
  end

  def menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play"
    p "Enter q to quit"

    p_or_q = gets.chomp

    if p_or_q == "p"
      setup
    else
      exit
    end
  end

  def setup
    computer_place_ships
    player_place_ships
  end

  def computer_place_ships
    # need random_coordinate_generator helper method
    # ---> based on board.cells --> iterate through the cells using 'Random' and loop until it finds valid_placement?
    # .place in board class places ship based on length etc and also calls on valid_placement?

  end

  def player_place_ships
    # will prompt user to place ship and will return error if valid_placement? == false
  end

  def turns
    player_turn # helper method
    computer_turn # helper method
  end

  def results
    # prints results
  end

  def the_end
    # prints something
  end
end


### Methods
# setup
# exit
# computer_place_ships
#  ---- need random_coordinate_generator
# player_place_ships

## turns --> display the boards at the start of the turn (user does not see computer ships)
# player_turn
# computer_turn

# results
# the_end