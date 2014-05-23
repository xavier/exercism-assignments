require 'minitest/autorun'

class Luhn

  def initialize(number)
    @number = number
  end

  def addends
    enumerate_digits(@number).map do |position, digit|
      multiply_digit(position, digit)
    end
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(n)
    luhn = Luhn.new(n*10)
    n*10 + (10 - luhn.checksum) % 10
  end

  private

  def enumerate_digits(number)
    digits = []
    while number != 0 do
      digits.unshift [digits.size.succ, (number % 10)]
      number /= 10
    end
    digits
  end

  def multiply_digit(position, digit)
    if position.even?
      double_digit(digit)
    else
      digit
    end
  end

  def double_digit(digit)
    times2 = digit * 2
    times2 > 9 ? (times2 - 9) : times2
  end

end
