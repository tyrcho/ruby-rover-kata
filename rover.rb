class Rover
  attr_reader :x, :orientation

  def initialize(x: 0, orientation: :east)
    @x = x
    @orientation = orientation
  end

  def execute(commands)
    return self if commands.empty?
    command = commands[0]
    tail = commands[1..-1]
    Rover
        .new(x: x + (dx command),
             orientation: orientation)
        .execute(tail)
  end

  private

  def dx(command)
    return 0 if orientation == :north

    if goes_west?(command)
      -1
    elsif goes_east?(command)
      1
    else
      throw ''
    end
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
