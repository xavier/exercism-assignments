class Beer

  NEWLINE = "\n"

  def verse(bottles)
    assemble first_line(bottles),
             second_line(bottles)
  end

  def sing(bottles_available, bottles_left = 0)
    assemble verses(bottles_available, bottles_left)
  end

  private

  def assemble(*parts)
    Array(parts).join(NEWLINE) + NEWLINE
  end

  def verses(bottles_available, bottles_left)
    bottles_available.downto(bottles_left).map { |bottles| verse(bottles) }
  end

  def first_line(n)
    BottlesOfBeer.new(n).to_s
  end

  def second_line(n)
    (n > 0) ? TakeBeer.new(n).to_s : NoMoreBeer.new.to_s
  end

  Line = Struct.new(:bottles) do

    def to_s
      (template % context).capitalize
    end

    protected

    def template
      ""
    end

    def context
      {}
    end

    def pluralized_bottles(count)
      case count
      when 0
        "no more bottles"
      when 1
        "1 bottle"
      else
        "#{count} bottles"
      end
    end

  end

  class BottlesOfBeer < Line

    def template
      "%{bottles} of beer on the wall, %{bottles} of beer."
    end

    def context
      {bottles: pluralized_bottles(bottles)}
    end

  end

  class TakeBeer < Line

    def template
      "Take %{what} down and pass it around, %{bottles} of beer on the wall."
    end

    def context
      {what: take_what_down(bottles), bottles: pluralized_bottles(bottles-1)}
    end

    def take_what_down(count)
      count == 1 ? "it" : "one"
    end

  end

  class NoMoreBeer < Line

    def template
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end

  end

end