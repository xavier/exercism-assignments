class Trinary

  POWERS_OF_3 = Hash.new { |cache, nth_power| cache[nth_power] = 3**nth_power }

  def initialize(string_of_digits)
    @digits = string_of_digits.chars.reverse
  end

  def to_decimal
    (0...@digits.length).reduce(0) do |sum_of_powers, nth_digit|
      sum_of_powers + (@digits[nth_digit].to_i * POWERS_OF_3[nth_digit])
    end
  end

end