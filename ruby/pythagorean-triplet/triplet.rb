
module NaturalNumbers

  def self.enumerate(lower_bound, upper_bound)
    Enumerator.new do |enum|
      i = lower_bound
      while i <= upper_bound
        enum.yield i
        i += 1
      end
    end.lazy
  end

end

class Triplet

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a*@a + @b*@b == @c*@c
  end

  def self.where(min_factor: 1, max_factor: nil, sum: nil)
    triplets = []
    NaturalNumbers.enumerate(min_factor, max_factor).each do |m|
      NaturalNumbers.enumerate(min_factor, m).each do |n|
        NaturalNumbers.enumerate(n, max_factor).each do |p|
          triplet = new(m, n, p)
          if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
            triplets << triplet
          end
        end
      end
    end
    triplets
  end

end
