require "./lib/asciiable"

class Game
  include Asciiable
  attr_reader :menu

  def initialize
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @computer_board = Board.new
    @human_board = Board.new
    @comp_sunk_ships = 0
    @human_sunk_ships = 0
  end

  def menu
    puts welcome
    sleep(1.0)
    puts battleship
    sleep(1.5)
    p "Enter p to play"
    p "Enter q to quit"

    p_or_q = gets.chomp

    if p_or_q == "p"
      puts boat
      setup
    else
      exit
    end
  end

  def setup
    computer_place_sub 
    computer_place_cruiser 
    sleep(1.3)
    player_place_cruiser
    player_place_sub
    sleep(1.3)
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
    puts "I have laid out my ships on the grid."
    sleep(1.0)
    puts "You now need to lay out your two ships."
    sleep(1.0)
    puts "The Cruiser is three units long and the Submarine is two units long."
    @human_board.render
    
    puts "Enter the squares for the Cruiser (3 spaces):"
    human_coord_cruiser = gets.chomp.upcase.split()
    true_coords = human_coord_cruiser.all? { |coordinate| @human_board.valid_coordinate?(coordinate) } 
    
    if !true_coords || (@human_board.valid_placement?(@cruiser, human_coord_cruiser) == false) 
      puts "Try again with valid coordinates." 
      player_place_cruiser
    else
      @human_board.place(@cruiser, human_coord_cruiser)
      @human_board.render(true)
    end
  end

  def player_place_sub
    puts "Enter the squares for the Submarine (2 spaces):"
    human_coord_sub = gets.chomp.upcase.split()
    true_coords = human_coord_sub.all? { |coordinate| @human_board.valid_coordinate?(coordinate) } 

    if !true_coords || (@human_board.valid_placement?(@submarine, human_coord_sub) == false)
      puts "Try again with valid coordinates."
      player_place_sub
    else
      @human_board.place(@submarine, human_coord_sub)
      @human_board.render(true)
    end
  end
  
  def display_board
    p "=============COMPUTER BOARD============="
    @computer_board.render
    sleep(1.0)

    p "==============PLAYER BOARD=============="
    @human_board.render(true)
    sleep(1.0)
  end

  def computer_turn
    human_keys = @human_board.cells.keys
    target = nil
    until target && !@human_board.cells[target].fired_upon? && @human_board.valid_coordinate?(target)
      target = human_keys.sample
    end
    @human_board.cells[target].fire_upon
    return_shots(target)
  end

  def return_shots(shot)
    if @human_board.cells[shot].render == "X"
      puts sunk
      puts "My shot at #{shot} sunk your ship! Take that!"
    elsif @computer_board.cells[shot].render == "X"
      puts sunk
      puts "Your shot at #{shot} sunk my ship! Damn youse all to hell!"
    elsif @human_board.cells[shot].render == "H"
      puts got_you
      puts "My shot at #{shot} was a hit! There's more where that came from! Scared yet?"
    elsif @computer_board.cells[shot].render == "H"
      puts you_got_me
      puts "Your shot at #{shot} was a hit! You got lucky!"
    elsif @human_board.cells[shot].render == "M"
      puts you_miss
      puts "My shot at #{shot} was a miss! You can't hide forever..."
    elsif @computer_board.cells[shot].render == "M"
      puts i_miss
      puts "Your shot at #{shot} was a miss! Not even close!"
    end
  end

  def player_turn
    p "Enter the coordinate for your shot: "
    target = gets.chomp.upcase
    until @computer_board.valid_coordinate?(target) &&
    @computer_board.cells[target].fired_upon? == false do
    p "That coordinate has been fired upon already, please try again."
    target = gets.chomp.upcase
    end
    @computer_board.cells[target].fire_upon
    check_sunk_ships(target)
    return_shots(target)
  end

  def check_sunk_ships(shot)
    if @computer_board.cells[shot].render == "X"
    @comp_sunk_ships += 1
    elsif @human_board.cells[shot].render == "X"
      @human_sunk_ships += 1
    end
  end

  def turns
    until @comp_sunk_ships == 2 || @human_sunk_ships == 2 do
      display_board
      computer_turn
      sleep(0.5)
      display_board
      player_turn
    end
   
    if @comp_sunk_ships == 2
      display_board
      puts "How did you beat me??? Try again, I want a rematch"
      sleep(0.8)
      game_over
    else
      @human_sunk_ships == 2
      display_board
      puts "Next time bring a challenge, new meat. I WIN!!!"
      sleep(0.8)
      game_over
    end
  end

  def game_over
    puts ascii_game_over
    sleep(1.5)
    puts play_again

    @computer_board = Board.new
    @human_board = Board.new
    @comp_sunk_ships = 0
    @human_sunk_ships = 0
  
    menu
  end
end
  