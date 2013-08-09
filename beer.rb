class Beer

  NEWLINE = "\n"

  def verse(bottles)
    assemble [first_line(bottles), second_line(bottles)]
  end

  def sing(from_bottles, bottles_left = 0)
    assemble verses(from_bottles, bottles_left)
  end

  private

  def assemble(parts)
    parts.join(NEWLINE) + NEWLINE
  end

  def verses(from_bottles, bottles_left)
    from_bottles.downto(bottles_left).map { |bottles| verse(bottles) }
  end

  def first_line(n)
    BottlesOfBeer.new(n).to_s
  end

  def second_line(n)
    if n.zero?
      NoMoreBeer.new.to_s
    else
      TakeBeer.new(n).to_s
    end
  end

  Line = Struct.new(:bottles) do

    def template
      ""
    end

    def to_s
      (template % context).capitalize
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
      {what: take_what_down(bottles), bottles: pluralized_bottles(bottles.pred)}
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