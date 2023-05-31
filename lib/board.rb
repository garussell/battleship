
class Board
  attr_reader :cells
  
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    letters = coordinates.map { |coord| coord[0] }
    numbers = coordinates.map { |coord| coord[1] }
    
    ord_letter = letters.map(&:ord)
    num = numbers.map(&:to_i)
    consecutive_order = consecutive_order?(ord_letter, num) 
    
    (ship.length == coordinates.length) && consecutive_order &&
    (coordinates.all? {|cell| @cells[cell].empty? })
  end

  def consecutive_order?(ord_letter, num)
    (ord_letter.uniq.size == 1 && (num.each_cons(2).all? { |val_1, val_2| val_2 == val_1 + 1 })) ||
    (num.uniq.size == 1 && ord_letter.each_cons(2).all? { |num_1, num_2| num_2 == num_1 + 1 })  
  end
  
  def place(ship, coordinates)
    valid_placement?(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(ship_view = false)
    puts "  1 2 3 4 \n" + "A #{@cells["A1"].render(ship_view)} #{@cells["A2"].render(ship_view)} #{@cells["A3"].render(ship_view)} #{@cells["A4"].render(ship_view)} \n" + "B #{@cells["B1"].render(ship_view)} #{@cells["B2"].render(ship_view)} #{@cells["B3"].render(ship_view)} #{@cells["B4"].render(ship_view)} \n" + "C #{@cells["C1"].render(ship_view)} #{@cells["C2"].render(ship_view)} #{@cells["C3"].render(ship_view)} #{@cells["C4"].render(ship_view)} \n" + "D #{@cells["D1"].render(ship_view)} #{@cells["D2"].render(ship_view)} #{@cells["D3"].render(ship_view)} #{@cells["D4"].render(ship_view)} \n"
  end
end
<<<<<<< HEAD

# def placement_length
#   ship.length == coordinates.length
# end
# @board.cells.ship.length(?) - 
# does conseceutive_order method need if (block) else nil to elimate diagonals?
# what if the length == the coordinates range?
# placement must be equal to ship size "return false if 'placement'!= @length"
# placement must be either horizontal or vertical, not diagnal
# how to make sure there are no gaps: enumerable .each_cons(n){ ... }   ?
#   horizontal =  - current_placement = A1 ... current_placement.next = A2 ... if current placement != next than false
# vertical = current = A1, next = B1 ... or, if @cruiser && A1, than A2/A3 or B1/C1

### helper methods:
## hypothesis for consecutive_order helper method:
# so valid_placement? takes two args (ship, coordinates) ... coordinates is an array that we can iterate through.  maybe we can use .ord to convert A1/A2 into numbers then sort them.  If sorted value != original value than return false... aka not valid placement

## hypothesis for placement_length:
# coordinates.length == ship.length

##hypothesis for vertical || horizontal placement:
# vertical || horizontal therefore  not diagonal

### Render the board:
## hypothesis:
# create method that 'prints' instance of board in the desired format using /n for line breaks
# board class is rendered with all of the cells and maybe dynamic b/c a new instance could have more cells per user choice
# after each turn (computer/user), the instance of 'board' can be rendered again, whish should show '.', 'S', 'M', or 'H'
# the trick will be to only render user board to the user and keep the computer board 'private'
# thinking ahead - the user can choose board size or number of ships, size of ships, and name of ships (aka new ship instance) if the code is dynamic
# if user decides they want 3 ships, size 2,3, and 5, these preferences will be passed in as argument in new instance of ship class
# if user wants a larger board, this will be passed as argument in new instance of board class
=======
>>>>>>> iteration_3_ar
