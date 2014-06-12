
class Palindromes

  class Palindrome

    attr_reader :value, :factors

    def initialize(value, factors = [])
      @value, @factors = value, factors
    end

  end

  def initialize(max_factor: nil, min_factor: 1)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def generate
    palindromes = Hash.new { |h, k| h[k] = Palindrome.new(k) }
    enumerate_palindromes do |product, factors|
      palindromes[product].factors << factors
    end
    @ordered_palindromes = palindromes.values.sort_by(&:value)
  end

  def smallest
    @ordered_palindromes.first
  end

  def largest
    @ordered_palindromes.last
  end

  private

  def palindrome?(n)
    as_string = n.to_s
    as_string == as_string.reverse
  end

  # yields (product, factors) pairs where product is a palindrome
  def enumerate_palindromes(&block)
    enumerate_factors do |a, b|
      product = a * b
      block.(product, [a, b]) if palindrome?(product)
    end
  end

  # yields all (a, b) factors in @min_factor..@max_factor where a < b
  def enumerate_factors(&block)
    (@min_factor..@max_factor).each do |a|
      (@min_factor..a).each do |b|
        a < b ? block.(a, b) : block.(b, a)
      end
    end
  end

end