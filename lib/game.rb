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
    # coordinates_3 = random_coordinate_generator(@computer_cruiser.length) 
    # @computer_board.place(@computer_cruiser, coordinates_3)
    # coordinates_2 = random_coordinate_generator(@computer_submarine.length) 
    # @computer_board.place(@computer_submarine, coordinates_2)
   
  end

  def random_coordinate_generator(ship_size)
    # ship_coords = []
    # ship_size.times { ship_coords << @computer_board.cells.sample until ship_coords.valid_placement? == true }
  end

  def player_place_ships
    player_coordinates = []
    p "Enter the first coordinate for Cruiser"
    first_coordinate = gets.chomp
    player_coordinates << first_coordinate
    p "Enter the second coordinate for Cruiser"
    second_coordinate = gets.chomp
    player_coordinates << second_coordinate

    if player_coordinates.valid_placement?(@cruiser, player_coordinates) == false
      p "Try again with valid coordinates."
      exit
    end

    p "Enter the third coordinate for Cruiser"
    third_coordinate = gets.chomp
    player_coordinates << third_coordinate


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