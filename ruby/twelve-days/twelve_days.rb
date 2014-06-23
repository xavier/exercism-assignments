class TwelveDaysSong

  VERSES = [
    ["first", "a Partridge in a Pear Tree"],
    ["second", "two Turtle Doves"],
    ["third", "three French Hens"],
    ["fourth", "four Calling Birds"],
    ["fifth", "five Gold Rings"],
    ["sixth", "six Geese-a-Laying"],
    ["seventh", "seven Swans-a-Swimming"],
    ["eighth", "eight Maids-a-Milking"],
    ["ninth", "nine Ladies Dancing"],
    ["tenth", "ten Lords-a-Leaping"],
    ["eleventh", "eleven Pipers Piping"],
    ["twelfth", "twelve Drummers Drumming"]
  ]

  TEMPLATE = "On the %{nth} day of Christmas my true love gave to me, %{stuff}.\n"

  def sing
    verses(1, VERSES.size)
  end

  def verses(from, to)
    (from..to).map { |n| verse(n) }.join("\n") + "\n"
  end

  def verse(n)
    nth, stuff = VERSES[n.pred]
    TEMPLATE % {nth: nth, stuff: stuff(n.pred)}
  end

  private

  def stuff(n)
    s = ""
    while n > 0 do
      s += VERSES[n][1] + ", "
      n -= 1
    end
    s += "and " unless s.empty?
    s += VERSES[0][1]
  end

end