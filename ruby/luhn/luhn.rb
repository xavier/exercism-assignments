require 'minitest/autorun'

class Luhn

  def initialize(number)
    @digits = number.to_s.scan(/\d/).map(&:to_i)
  end

  def addends
    @digits.each_with_index.map { |d, i| multiply_digit(@digits.size-i, d)  }
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

  def multiply_digit(position, digit)
    if position.even?
      times2 = digit * 2
      times2 > 9 ? (times2 - 9) : times2
    else
      digit
    end
  end

end
