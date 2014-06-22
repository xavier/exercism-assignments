
class Garden

  PLANTS = {
    "C" => :clover,
    "G" => :grass,
    "R" => :radishes,
    "V" => :violets
  }

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

  def initialize(cups_diagram, students = DEFAULT_STUDENTS)
    cups = parse_cups_diagram(cups_diagram)
    @assigned_cups = assign_cups(cups, students.sort)
  end

  def method_missing(student_name, *)
    @assigned_cups.fetch(student_name.to_s) { super }
  end

  private

  def parse_cups_diagram(diagram)
    diagram.lines.map { |line| parse_cups_diagram_row(line) }
  end

  def parse_cups_diagram_row(line)
    line.chars.map { |char| PLANTS[char] }
  end

  def assign_cups(cups, students)
    students.
      each_with_index.
      take_while { |student, index| index < (cups.first.size / 2) }.
      each_with_object({}) do |(student, index), assigned_cups|
        assigned_cups[student_method_name(student)] = plants(cups, index)
      end
  end

  def student_method_name(student)
    student.downcase
  end

  def plants(cups, index)
    offset = index * 2
    cups[0][offset, 2] + cups[1][offset, 2]
  end

end