
class Garden

  class Diagram

    PLANTS = {
      "C" => :clover,
      "G" => :grass,
      "R" => :radishes,
      "V" => :violets
    }

    def initialize(text)
      @text = text
    end

    def rows
      @rows ||= parse_rows
    end

    def cups_per_row
      rows.first.length
    end

    def take_cups(row, index, number_of_cups = 1)
      offset = index * number_of_cups
      rows[row][offset, number_of_cups]
    end

    private

    def parse_rows
      @text.lines.map { |line| parse_row(line) }
    end

    def parse_row(line)
      line.chars.map { |char| PLANTS[char] }
    end

  end

  DEFAULT_STUDENTS = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Fred",
    "Ginny",
    "Harriet",
    "Ileana",
    "Joseph",
    "Kincaid",
    "Larry"
  ]

  CUPS_PER_STUDENT         = 4
  ROWS                     = 2
  CUPS_PER_STUDENT_PER_ROW = CUPS_PER_STUDENT / ROWS

  def initialize(cups_diagram, students = DEFAULT_STUDENTS)
    @assigned_cups = assign_cups(Diagram.new(cups_diagram), students.sort)
  end

  def method_missing(student_name, *)
    @assigned_cups.fetch(student_name.to_s) { super }
  end

  private

  def assign_cups(diagram, students)
    enumerate_students_with_cups(diagram, students).
      each_with_object({}) do |(student, index), assigned_cups|
        assigned_cups[student_method_name(student)] = cups_for_student(diagram, index)
      end
  end

  def enumerate_students_with_cups(diagram, students)
    students.
      each_with_index.
      take_while { |student, index| index < (diagram.cups_per_row / CUPS_PER_STUDENT_PER_ROW) }
  end

  def student_method_name(student)
    student.downcase
  end

  def cups_for_student(diagram, index)
    (0...ROWS).inject([]) do |cups, row|
      cups + diagram.take_cups(row, index, CUPS_PER_STUDENT_PER_ROW)
    end
  end

end