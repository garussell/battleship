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
    if @ship != nil
      @ship.hit
      @shot_fired = true
    else
      @shot_fired
    end
  end
end