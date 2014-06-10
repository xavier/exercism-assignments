
class Queens

  DEFAULT_POSITIONS = {
    white: [0, 3],
    black: [7, 3]
  }

  attr_reader :white, :black

  def initialize(positions = {})
    start_positions = DEFAULT_POSITIONS.merge(positions)
    @white = start_positions[:white]
    @black = start_positions[:black]
    raise ArgumentError, "cannot occupy same space" if @white == @black
  end

  def attack?
    same_row? || same_column? || diagonal?
  end

  def to_s
    render_board do |row, col|
      render_board_item(row, col)
    end
  end

  private

  def same_row?
    @white[0] == @black[0]
  end

  def same_column?
    @white[1] == @black[1]
  end

  def diagonal?
    dy = (@white[0] - @black[0]).abs
    dx = (@white[1] - @black[1]).abs
    dx == dy
  end

  def render_board
    (0..7).map do |row|
      (0..7).map do |col|
        yield row, col
      end.join(" ")
    end.join("\n")
  end

  BOARD_ITEM_WHITE = "W"
  BOARD_ITEM_BLACK = "B"
  BOARD_ITEM_EMPTY = "O"

  def render_board_item(row, col)
    case [row, col]
      when @white then BOARD_ITEM_WHITE
      when @black then BOARD_ITEM_BLACK
                  else BOARD_ITEM_EMPTY
    end
  end

end