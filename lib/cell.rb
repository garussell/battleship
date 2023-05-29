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

  def fire_upon
    @ship&.hit
    @shot_fired = true
  end

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


