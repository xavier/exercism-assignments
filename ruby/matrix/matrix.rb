
class Matrix

  class Accessor

    def initialize(&strategy)
      @strategy = strategy
    end

    def [](index)
      @strategy.(index)
    end

  end

  def initialize(string)
    @rows = parse(string)
  end

  def rows
    @row_accessor ||= Accessor.new { |index| @rows[index] }
  end

  def columns
    @column_accessor ||= Accessor.new do |index|
      (0...@rows.size).map { |row| @rows[row][index] }
    end
  end

  private

  ROW_SEPARATOR = "\n"

  def parse(string)
    string.
      split(ROW_SEPARATOR).
      map { |row| parse_row(row) }
  end

  def parse_row(string)
    string.scan(/\d+/).map(&:to_i)
  end

end
