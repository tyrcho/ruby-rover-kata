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
    Rover.new(x: x + (dx command)).execute(tail)
  end

  private

  def dx(command)
    return 0 if orientation == :north
    if command == 'B'
      -1
    elsif command == 'F'
      1
    else
      throw ''
    end
  end
end
