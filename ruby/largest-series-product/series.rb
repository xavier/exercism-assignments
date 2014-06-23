class Series

  attr_reader :digits

  def initialize(string_of_digits)
    @digits = string_of_digits.chars.map(&:to_i)
  end

  def slices(n)
    guard_against_slices_bigger_than_number!(n)
    n.zero? ? [] : digits.each_cons(n).to_a
  end

  def largest_product(n)
    slices(n).map { |factors| factors.reduce(:*) }.max || 1
  end

  private

  def guard_against_slices_bigger_than_number!(n)
    raise ArgumentError if n > @digits.count
  end

end