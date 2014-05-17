
class TriangleError < StandardError
end

class Triangle

  def initialize(a, b, c)
    @a = ensure_side_is_valid(a, b, c)
    @b = ensure_side_is_valid(b, a, c)
    @c = ensure_side_is_valid(c, a, b)
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

  def ensure_side_is_valid(side, other_side1, other_side2)
    if side > 0 && side < (other_side1+other_side2)
      side
    else
      raise TriangleError
    end
  end

end
