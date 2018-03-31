class Rover
  attr_reader :x, :y, :orientation

  @@clockwise = [:east, :north, :west, :south]

  def initialize(x: 0, y: 0, orientation: :east)
    @x = x
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


  def execute_single(command)
    if command == 'F'
      move 1
    elsif command == 'B'
      move -1
    elsif command == 'L'
      turn 1
    elsif command == 'R'
      turn -1
    else
      throw ''
    end
  end


  def turn(rotation)
    turned_index = @@clockwise.index(orientation) + rotation
    Rover
        .new(x: x,
             y: y,
             orientation: @@clockwise[turned_index % 4])
  end


  def move(fwd)
    Rover
        .new(x: x + fwd * (delta :east, :west),
             y: y + fwd * (delta :north, :south),
             orientation: orientation)
  end

  def delta(positive, negative)
    if orientation == positive
      1
    elsif orientation == negative
      -1
    else
      0
    end
  end
end
