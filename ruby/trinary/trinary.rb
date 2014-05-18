class Trinary

  POWERS_OF_3 = Hash.new { |cache, nth_power| cache[nth_power] = 3**nth_power }

  def initialize(string_of_digits)
    @digits = string_of_digits.chars
  end

  def to_decimal
    (0...@digits.length).reduce(0) do |sum_of_powers, nth_digit|
      position = @digits.length-(nth_digit+1)
      sum_of_powers + (@digits[position].to_i * POWERS_OF_3[nth_digit])
    end
  end

end