require 'minitest/autorun'

class Hexadecimal

  DIGITS = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "a" => 10,
    "b" => 11,
    "c" => 12,
    "d" => 13,
    "e" => 14,
    "f" => 15
  }

  def initialize(hexadecimal_string)
    @digits = hexadecimal_string.downcase.chars
  end

  def to_decimal
    @digits.reduce(0) do |decimal_value, digit|
      (decimal_value << 4) + DIGITS.fetch(digit) { return 0 }
    end
  end

end