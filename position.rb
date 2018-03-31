class Position
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    # noinspection RubyInstanceVariableNamingConvention
    @x = x
    # noinspection RubyInstanceVariableNamingConvention
    @y = y
    freeze
  end

  def +(that)
    Position.new(x: x + that.x,
                 y: y + that.y)
  end

  def ==(that)
    self.x == that.x &&
        self.y == that.y
  end

  def to_s
    "#{x}, #{y}"
  end

end