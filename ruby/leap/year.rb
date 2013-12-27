
class Year

  def initialize(year)
    @year = year
  end

  def leap?
    vanilla_leap_year? || exceptional_century?
  end

  private

  def vanilla_leap_year?
    divisible_by?(4) && !century?
  end

  def century?
    divisible_by?(100)
  end

  def exceptional_century?
    divisible_by?(400)
  end

  def divisible_by?(n)
    @year % n == 0
  end

end