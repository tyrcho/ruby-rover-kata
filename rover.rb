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
      forward
    elsif command == 'B'
      backwards
    elsif command == 'L'
      left
    elsif command == 'R'
      right
    else
      throw ''
    end
  end

  def left
    turned = if orientation == :north
               :west
             elsif orientation == :west
               :south
             elsif orientation == :south
               :east
             elsif orientation == :east
               :north
             end
    Rover
        .new(x: x,
             y: y,
             orientation: turned)
  end

  def right
    turned = if orientation == :south
               :west
             elsif orientation == :west
               :north
             elsif orientation == :north
               :east
             elsif orientation == :east
               :south
             end
    Rover
        .new(x: x,
             y: y,
             orientation: turned)
  end

  def forward
    Rover
        .new(x: x + (delta :east, :west),
             y: y + (delta :north, :south),
             orientation: orientation)
  end

  def backwards
    Rover
        .new(x: x - (delta :east, :west),
             y: y - (delta :north, :south),
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
