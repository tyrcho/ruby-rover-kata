class Rover
  attr_reader :x, :y, :orientation

  def initialize(x: 0, y: 0, orientation: :east)
    # noinspection RubyInstanceVariableNamingConvention
    @x = x
    # noinspection RubyInstanceVariableNamingConvention
    @y = y
    @orientation = orientation
  end

  def execute(commands)
    return self if commands.empty?
    command = commands[0]
    tail = commands[1..-1]
    execute_single(command).execute(tail)
  end

  def ==(that)
    self.x == that.x &&
        self.y == that.y &&
        self.orientation == that.orientation
  end

  private

  # noinspection RubyClassVariableUsageInspection
  @@clockwise = [:east, :north, :west, :south]

  def execute_single(command)
    case command
      when 'F'
        move 1
      when 'B'
        move -1
      when 'L'
        turn 1
      when 'R'
        turn -1
      else
        throw ''
    end
  end


  def turn(rotation)
    turned_index = @@clockwise.index(orientation) + rotation
    Rover.new(
        x: x,
        y: y,
        orientation: @@clockwise[turned_index % @@clockwise.length])
  end


  def move(direction)
    Rover.new(
        x: x + direction * (delta :east, :west),
        y: y + direction * (delta :north, :south),
        orientation: orientation)
  end

  def delta(positive, negative)
    case orientation
      when positive
        1
      when negative
        -1
      else
        0
    end
  end

end
