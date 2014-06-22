
class Robot

  attr_reader :bearing, :coordinates

  BEARINGS = [:north, :east, :south, :west]
  RIGHT    = +1
  LEFT     = -1

  MOVEMENTS = {
    :north => [0, 1],
    :east  => [1, 0],
    :south => [0, -1],
    :west  => [-1, 0],
  }

  def initialize
    @coordinates = [0, 0]
    @bearing     = :north
  end

  def orient(new_bearing)
    raise ArgumentError unless BEARINGS.include?(new_bearing)
    @bearing = new_bearing
    self
  end

  def turn_right
    turn(RIGHT)
    self
  end

  def turn_left
    turn(LEFT)
    self
  end

  def at(x, y)
    @coordinates = [x, y]
    self
  end

  def advance
    @coordinates[0] += movement[0]
    @coordinates[1] += movement[1]
    self
  end

  private

  def movement
    MOVEMENTS[@bearing]
  end

  def turn(direction)
    index = BEARINGS.index(@bearing)
    @bearing = BEARINGS[(index + direction) % BEARINGS.size]
  end

end


class Simulator

  def instructions(letter_string)
    letter_string.chars.map do |letter|
      decode_instruction(letter)
    end
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.at(x, y).orient(direction)
  end

  def evaluate(robot, letter_string)
    instructions(letter_string).each do |instruction|
      robot.public_send(instruction)
    end
  end

  private

  INSTRUCTIONS = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance,
  }

  def decode_instruction(letter)
    INSTRUCTIONS.fetch(letter)
  end

end