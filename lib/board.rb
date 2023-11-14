
class Board
  attr_reader :cells, :board_size
  
  def initialize(board_size)
    @board_size = board_size
    @cells = create_cells
  end

  def create_cells
    cells = {}
    letters = ("A"..("A".ord + @board_size - 1).chr).to_a
    numbers = (1..@board_size).to_a
    letters.each do |letter|
      numbers.each do |number|
        coordinate = letter + number.to_s
        cells[coordinate] = Cell.new(coordinate)
      end
    end
    cells
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

  def render(show_board = false) 
    if show_board
      "#{first_line} \n" +
      "#{next_lines(show_board)}"
    else
      "#{first_line} \n" +
      "#{next_lines(show_board)}"
    end
  end

  def first_line
    string = " "
    (1..board_size).each do |num|
      string += " #{num}"
    end
    string
  end

  def next_lines(show_board)
    letters = ("A"..("A".ord + @board_size - 1).chr).to_a
    string = ""
    letters.each do |letter|
      string += "#{letter}"
      letter_keys = create_cells.select do |key|
        key[0] == letter
      end
      
      letter_keys.keys.map do |key|
        string += " #{cells[key].render(show_board)}"
      end 
      string += " \n"
    end
    string
  end
end

