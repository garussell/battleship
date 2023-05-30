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
    computer_place_sub 
    computer_place_cruiser 
    player_place_cruiser
    player_place_sub
    turns
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
    else
    computer_place_cruiser
    end
  end

  def player_place_cruiser
    p "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long. Enter the first coordinate for Cruiser"
    @human_board.render
    
    p "Enter the squares for the Cruiser (3 spaces):"
    human_coord_cruiser = gets.chomp.upcase.split()
    if @human_board.valid_placement?(@cruiser, human_coord_cruiser) == false
      p "Try again with valid coordinates." 
      setup
    end
    @human_board.place(@cruiser, human_coord_cruiser)
    @human_board.render(true)
  end

  def player_place_sub
    p "Enter the squares for the Submarine (2 spaces):"
    human_coord_sub = gets.chomp.upcase.split()
    if @human_board.valid_placement?(@submarine, human_coord_sub) == false
      p "Try again with valid coordinates." 
      setup
    end
    @human_board.place(@submarine, human_coord_sub)
    @human_board.render(true)
  end
  
  def turn
    # loops through the computer/player turns until someone wins
  end
  
  def display_board
    p "=============COMPUTER BOARD============="
    @computer_board.render
    
    p "==============PLAYER BOARD=============="
    @human_board.render(true)
  end
  
  def computer_turn
    human_keys = @human_board.cells.keys
    target = human_keys.sample(1).join
    until (@human_board.cells(target).fired_upon? == false) &&
      @human_board.valid_coordinate?(target) do 
        target
      end
      @human_board.cells(target).fire_upon
      return_shots(target)
    end
  end

  def return_shots
    # what was the return value of the shot per turn?
    # tells us if the shot was "H", "M", "X" etc
 
  end

  def player_turn
    p "Enter the coordinate for your shot: "
    
    target = gets.chomp.upcase
    until @computer_board.valid_coordinate?(target) &&
      @computer_board.cells(target).fired_upon? == false do
        p "That coordinate has been fired upon already, please try again."
        target
      end

      @computer_board.cells(target).fire_upon
      return_shots(target)
    end
  end
end

  # def results
  #   # prints results
  # end

  # def the_end
      # 5 x's = game over
  #   # prints something
      # choice to play again or exit
      # if play again go back to menu
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