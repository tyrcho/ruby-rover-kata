require './position'

class Planet
  attr_reader :north_east, :south_west

  def initialize(north_east: Position.new(x: 100, y: 100),
                 south_west: Position.new(x: -100, y: -100))

    @north_east = north_east
    @south_west = south_west
    freeze
  end

  def wrap(position)
    if position.x > north_east.x
      Position.new(x: south_west.x, y: position.y)
    elsif position.x < south_west.x
      Position.new(x: north_east.x, y: position.y)
    elsif position.y < south_west.y
      Position.new(x: position.x, y: north_east.y)
    elsif position.y > north_east.y
      Position.new(x: position.x, y: south_west.y)
    else
      position
    end
  end

  def to_s
    "NE: #{north_east}, SW: #{south_west}"
  end

end