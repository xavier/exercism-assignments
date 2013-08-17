class SumOfMultiples

  DEFAULT_DIVISORS = [3, 5]

  def self.to(n)
    new(*DEFAULT_DIVISORS).to(n)
  end

  def initialize(*divisors)
    @pick_multiples = build_multiples_filter(divisors)
  end

  def to(n)
    (0...n).select(&@pick_multiples).reduce(:+)
  end

  private

  NOT_A_MULTIPLE = ->(x) { false }

  def build_multiples_filter(divisors)
    divisors.inject(NOT_A_MULTIPLE) do |filter, divisor|
      ->(x) { (x % divisor == 0) || filter.(x) }
    end
  end

end