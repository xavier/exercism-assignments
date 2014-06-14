
class OCR

  DIGITS = [
    [" _ ", "   ", " _ ", " _ ", "   ", " _ ", " _ ", " _ ", " _ ", " _ "],
    ["| |", "  |", " _|", " _|", "|_|", "|_ ", "|_ ", "  |", "|_|", "|_|"],
    ["|_|", "  |", "|_ ", " _|", "  |", " _|", "|_|", "  |", "|_|", " _|"]
  ]

  def initialize(text)
    @text = text
  end

  def convert
    @text.split("\n\n").map { |line| convert_line(line) }.join(",")
  end

  def convert_line(line)
    characters = line.lines.map { |line| line.chomp.scan(/.../) }.transpose
    characters.map { |char| convert_digit(char) }.join
  end

  def convert_digit(text_lines)
    possible_digits = 0..9
    text_lines.each_with_index do |text_line, line_number|
      possible_digits = filter_possible_digits(line_number, text_line, possible_digits)
    end
    possible_digits.one? ? possible_digits.first.to_s : "?"
  end

  def filter_possible_digits(digit_line, text_line, possible_digits)
    text_to_match = DIGITS[digit_line]
    possible_digits.select { |digit| text_line == text_to_match[digit] }
  end

end