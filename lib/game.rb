class Game
  attr_reader :menu

  def initialize
    # @computer_ships = []
    # @human_ships = []
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @computer_board = Board.new
    @human_board = Board.new
    # @board_type = 
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
    computer_place_sub 
    computer_place_cruiser 
    player_place_ships
    # the_end
  end

  def computer_place_sub 
    valid_cells = @computer_board.cells.keys.sample(2)
    if @computer_board.valid_placement?(@computer_submarine, valid_cells)
    @computer_board.place(@computer_submarine, valid_cells)
    else
    computer_place_sub
    end
  end

  def computer_place_cruiser
    valid_cells = @computer_board.cells.keys.sample(3)
    if @computer_board.valid_placement?(@computer_cruiser, valid_cells)
    @computer_board.place(@computer_cruiser, valid_cells)
    # puts @computer_board.render(true)
    else
    computer_place_cruiser
    end
  end

  def player_place_ships
    p "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long. Enter the first coordinate for Cruiser"
    @human_board.render
    p "Enter the squares for the Cruiser (3 spaces):"
    human_coord_cruiser = gets.chomp.upcase.split()
    @human_board.validation
    @human_board.place(@cruiser, human_coord_cruiser)
    @human_board.render(true)
    p "Enter the squares for the Submarine (2 spaces):"
    human_coord_sub = gets.chomp.upcase.split()
    @human_board.validation
    @human_board.place(@submarine, human_coord_sub)
    @human_board.render(true)
  end

  def validation

    if human_coord_cruiser.valid_placement?(@cruiser, human_coord_cruiser) == false || human_coord_sub.valid_placement?(@submarine, human_coord_sub) == false
    p "Try again with valid coordinates."
        player_place_ships
    else 
      true
    end
  end
end

    

    # will prompt user to place ship and will return error if valid_placement? == false

  # def turns
  #   player_turn # helper method
  #   computer_turn # helper method
  # end

  # def results
  #   # prints results
  # end

  # def the_end
  #   # prints something
  # end


### Methods
# setup
# exit
# computer_place_ships
#  ---- need random_coordinate_generator
# player_place_ships

## turns --> display the boards at the start of the turn (user does not see computer ships)
# player_turn
# computer_turn

# results/display
# the_end
#loop to menu after the_end



# Things we want to ask Dani about:

# 1)creating a module for game class and board class
# 2) Refactoring the place ships methods. Do we need a method for each ship or is there a more dynamic way of handling human ships and computer ships?
# 3)previous comments on endgame
# 4) regarding expansion and iteration 4