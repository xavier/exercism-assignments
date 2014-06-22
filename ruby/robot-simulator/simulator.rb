
class Robot

  class Bearing

    attr_reader :index, :name, :movement

    def initialize(index, name, movement)
      @index, @name, @movement = index, name, movement
    end

  end

  BEARINGS = [
    Bearing.new(0, :north, [0, 1]),
    Bearing.new(1, :east,  [1, 0]),
    Bearing.new(2, :south, [0, -1]),
    Bearing.new(3, :west,  [-1, 0]),
  ]

  RIGHT = +1
  LEFT  = -1

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
    at(0, 0).orient(:north)
  end

  def orient(new_bearing)
    @bearing = BEARINGS.detect { |b| b.name == new_bearing }
    raise ArgumentError unless @bearing
    self
  end

  def bearing
    @bearing.name
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
    @coordinates = @coordinates.move(*@bearing.movement)
    self
  end

  private

  def turn(direction)
    @bearing = BEARINGS[(@bearing.index+ direction) % BEARINGS.size]
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