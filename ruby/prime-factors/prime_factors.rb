module PrimeFactors

  require 'prime'

  def self.for(n)
    primes = Prime.instance.to_enum
    factors = []
    while n > 1
      divisor = primes.next
      while n > 1 && (n % divisor).zero?
        factors << divisor
        n /= divisor
      end
    end
    factors
  end

end