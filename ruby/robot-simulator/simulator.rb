
class Robot

  attr_reader :bearing

  BEARINGS = [:north, :east, :south, :west]
  RIGHT    = +1
  LEFT     = -1

  MOVEMENTS = {
    :north => [0, 1],
    :east  => [1, 0],
    :south => [0, -1],
    :west  => [-1, 0],
  }

  class Coordinates

    attr_reader :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def move(horizontally, vertically)
      Coordinates.new(@x + horizontally, @y + vertically)
    end

    def to_a
      [@x, @y]
    end

  end

  def initialize
    @coordinates = Coordinates.new(0, 0)
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
    @coordinates = Coordinates.new(x ,y)
    self
  end

  def coordinates
    @coordinates.to_a
  end

  def advance
    @coordinates = @coordinates.move(*movement)
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