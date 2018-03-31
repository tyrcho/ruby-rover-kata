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

  private

  def execute_single(command)
    if command == 'F'
      forward
    elsif command == 'B'
      backwards
    else
      throw ''
    end
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
