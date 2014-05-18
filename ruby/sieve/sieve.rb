require 'set'

class Sieve

  def initialize(upper_bound)
    @upper_bound = upper_bound
  end

  def primes
    candidates = (2..@upper_bound).to_a
    n = 2
    while n < @upper_bound do
      candidates.reject! { |c| (c != n) && (c % n).zero? }
      n += 1
    end
    candidates.to_a
  end
end