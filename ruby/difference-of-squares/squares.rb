
class Squares

  def initialize(n)
    @numbers = 1..n
  end

  def square_of_sums
    @numbers.reduce(:+) ** 2
  end

  def sum_of_squares
    @numbers.reduce { |sum, x| sum + (x * x) }
  end

  def difference
    square_of_sums - sum_of_squares
  end

end
