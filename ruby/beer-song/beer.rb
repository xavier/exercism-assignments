class Beer

  NEWLINE = "\n"

  def verse(bottles)
    assemble Verse.new(bottles).lines
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

end

class Verse

  def initialize(bottles)
    @bottles = bottles
    @context = VerseContext.new(@bottles)
  end

  def lines
    [first_line, second_line].map { |line| @context.apply(line) }
  end

  private

  def first_line
    "%{bottles_available} of beer on the wall, %{bottles_available} of beer."
  end

  def second_line
    if @bottles > 0
      "Take %{take_what} down and pass it around, %{bottles_left} of beer on the wall."
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end

end

VerseContext = Struct.new(:bottles) do

  def apply(template)
    (template % context).capitalize
  end

  def context
    {
      bottles_available: pluralized_bottles(bottles),
      bottles_left: pluralized_bottles(bottles-1),
      take_what: take_what(bottles)
    }
  end

  private

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

  def take_what(count)
    count == 1 ? "it" : "one"
  end

end
