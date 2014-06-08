
class Binary

  BIT_0 = "0"
  BIT_1 = "1"

  class InvalidDigit < StandardError ; end

  def initialize(string_of_bits)
    @bits = string_of_bits.chars
  end

  def to_decimal
    @bits.reduce(0) do |decimal_value, bit|
      decimal_value <<= 1
      if    bit == BIT_1 then decimal_value += 1
      elsif bit != BIT_0 then raise InvalidDigit end
      decimal_value
    end
  rescue InvalidDigit
    0
  end

end