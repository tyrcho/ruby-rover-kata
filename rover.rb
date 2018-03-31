require './position'

# noinspection RubyClassVariableUsageInspection

class Rover
  attr_reader :orientation, :position

  def initialize( position: Position.new, orientation: :east)
    @position = position
    @orientation = orientation
  end

  def execute(commands)
    rover = self
    commands.split('').each do |command|
      rover = rover.execute_single command
    end
    rover
  end

  def ==(that)
    self.position == that.position &&
        self.orientation == that.orientation
  end

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


  private

  @@clockwise = [:east, :north, :west, :south]


  def turn(rotation)
    turned_index = @@clockwise.index(orientation) + rotation
    Rover.new(
        position: position,
        orientation: @@clockwise[turned_index % @@clockwise.length])
  end


  def move(direction)
    Rover.new(
        position: position + Position.new(
            x: direction * (delta :east, :west),
            y: direction * (delta :north, :south)),
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
