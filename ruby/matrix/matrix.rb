
class Matrix

  class Accessor

    def initialize(&strategy)
      @strategy = strategy
    end

    def [](index)
      @strategy.(index)
    end

  end

  class Parser

    ROW_SEPARATOR = "\n"

    def parse(string)
      string.
        split(ROW_SEPARATOR).
        map { |row| parse_row(row) }
    end

    private

    def parse_row(row)
      row.scan(/\d+/).map(&:to_i)
    end

  end

  def initialize(string)
    @rows = Parser.new.parse(string)
  end

  def rows
    @row_accessor ||= Accessor.new { |index| @rows[index] }
  end

  def columns
    @column_accessor ||= Accessor.new do |index|
      (0...@rows.size).map { |row| @rows[row][index] }
    end
  end

end
