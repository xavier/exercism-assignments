
class TriangleError < StandardError
end

class Triangle

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
    ensure_valid_sides!
  end

  def kind
    case
    when ab? && bc?
      :equilateral
    when ab? || bc? || ac?
      :isosceles
    else
      :scalene
    end
  end

  private

  def ab?
    @a == @b
  end

  def bc?
    @b == @c
  end

  def ac?
    @a == @c
  end

  def ensure_valid_sides!
    invalid_side!(:a) unless @a > 0
    invalid_side!(:b) unless @b > 0
    invalid_side!(:c) unless @c > 0
    invalid_sides!    unless meets_inequality_constraint?
  end

  def invalid_side!(side)
    raise TriangleError, "Side #{side} must be > 0"
  end

  def invalid_sides!
    raise TriangleError, "Fails to meet inequality constraint"
  end

  def meets_inequality_constraint?
    ((@a-@b).abs < @c) && (@c < (@a+@b))
  end

end
