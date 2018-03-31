require './position'
require './planet'

# noinspection RubyClassVariableUsageInspection

class Rover
  attr_reader :orientation, :position, :planet

  def initialize(
      position: Position.new,
      orientation: :east,
      planet: Planet.new)

    @position = position
    @orientation = orientation
    @planet = planet
    freeze
  end

  def execute(commands)
    rover = self
    commands.split('').each do |command|
      next_rover = rover.execute_single command
      if planet.accessible? next_rover.position
        rover = next_rover
      else
        puts "found an obstacle #{next_rover.position}"
        return rover
      end
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
        orientation: @@clockwise[turned_index % @@clockwise.length],
        planet: planet)
  end


  def move(direction)
    dx = direction * (sign :east, :west)
    dy = direction * (sign :north, :south)
    delta = Position.new(x: dx, y: dy)
    Rover.new(
        position: planet.wrap(position + delta),
        orientation: orientation,
        planet: planet)
  end

  def sign(positive, negative)
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
