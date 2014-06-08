
class Series

  def initialize(string_of_digits)
    @digits = string_of_digits.chars.map(&:to_i)
  end

  def slices(n)
    number_of_slices = @digits.count - n
    raise ArgumentError if number_of_slices < 0
    (0..number_of_slices).map { |i| @digits[i,n] }
  end

end
