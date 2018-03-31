require './position'

class Planet
  attr_reader :north_east, :south_west, :obstacles

  def initialize(north_east: Position.new(x: 100, y: 100),
                 south_west: Position.new(x: -100, y: -100),
                 obstacles: [])

    @north_east = north_east
    @south_west = south_west
    @obstacles = obstacles
    freeze
  end

  def accessible?(position)
    !obstacles.include? position
  end

  def wrap(position)
    x = position.x
    y = position.y
    if x > north_east.x
      Position.new(x: south_west.x, y: y)
    elsif x < south_west.x
      Position.new(x: north_east.x, y: y)
    elsif y < south_west.y
      Position.new(x: x, y: north_east.y)
    elsif y > north_east.y
      Position.new(x: x, y: south_west.y)
    else
      position
    end
  end

  def to_s
    "NE: #{north_east}, SW: #{south_west}"
  end

end