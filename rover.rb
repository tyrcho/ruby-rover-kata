class Rover
  attr_reader :x, :y, :orientation

  def initialize(x: 0, y: 0, orientation: :east)
    @x = x
    @y = y
    @orientation = orientation
  end

  def execute(commands)
    return self if commands.empty?
    command = commands[0]
    tail = commands[1..-1]
    Rover
        .new(x: x + (dx command),
             y: y + (dy command),
             orientation: orientation)
        .execute(tail)
  end

  private

  def dx(command)
    return 0 if orientation == :north || orientation == :south

    if goes_west?(command)
      -1
    elsif goes_east?(command)
      1
    else
      throw ''
    end
  end

  def dy(command)
    return 0 if orientation == :west || orientation == :east

    if goes_south?(command)
      -1
    elsif goes_north?(command)
      1
    else
      throw ''
    end
  end

  def goes_north?(command)
    (command == 'F' && orientation == :north) ||
        (command == 'B' && orientation == :south)
  end

  def goes_south?(command)
    (command == 'B' && orientation == :north) ||
        (command == 'F' && orientation == :south)
  end

  def goes_east?(command)
    (command == 'F' && orientation == :east) ||
        (command == 'B' && orientation == :west)
  end

  def goes_west?(command)
    (command == 'B' && orientation == :east) ||
        (command == 'F' && orientation == :west)
  end
end
