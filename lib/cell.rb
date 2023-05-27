class Cell
  attr_reader :coordinate,
              :ship, 
              :shot_fired

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shot_fired = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @shot_fired
  end

  # def fire_upon
  #   if @ship
  #     @ship.hit
  #     @shot_fired = true
  #   else
  #     @shot_fired = true
  #   end
  # end

  def fire_upon
    @ship&.hit
    @shot_fired = true
  end
  # def render(view = false)
  #   if @ship != nil && @ship.sunk?
  #     "X"
  #   elsif @ship != nil && @shot_fired == true
  #     "H"
  #   elsif @ship == nil && @shot_fired == true
  #     "M"
  #   elsif view == true && @ship != nil 
  #     "S"
  #   else 
  #     view == false && @shot_fired == false 
  #     "."
  #   end
  # end
  def render(view = false)
    if @ship&.sunk?
      "X"
    elsif @ship && @shot_fired
      "H"
    elsif !@ship && @shot_fired
      "M"
    elsif view && @ship
      "S"
    else
      "."
    end
  end
end
# For '.', the coordinate must be empty, ship is nil or hidden and shot_fired = false.
# For 'M', the coordinate must be empty, ship is nil and shot_fired = true.
# For 'S', the coordinate must have ship, ship is != nil and shot_fired = false.
# For 'H', the coordinate must have ship, ship is != nil and fired_upon = true.
# For 'X', the coordinate must have ship, ship is != nil and @ship.sunk? = true

