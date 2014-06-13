class Matrix

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
    @rows
  end

  def columns
    @columns ||= (0..@rows.first.size).map do |column|
      (0...@rows.size).map { |row| @rows[row][column] }
    end
  end

  def saddle_points
    rows.each_with_index.reduce([]) do |points, (row, row_index)|
      value, column_indices = saddle_point_candidate_columns(row)
      points + column_indices
        .select { |column_index| value <= columns[column_index].min }
        .map    { |column_index| [row_index, column_index] }
    end
  end

  private

  def saddle_point_candidate_columns(row)
    row.each_with_index.reduce([nil, []]) do |(max, candidates), (value, column_index)|
      case
      when max.nil? || value > max
        [value, [column_index]]
      when value == max
        [max, candidates << column_index]
      else
        [max, candidates]
      end
    end
  end

end
