class TwelveDaysSong

  VerseDefinition = Struct.new(:nth, :gift)

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
  ].map { |args| VerseDefinition.new(*args) }

  TEMPLATE = "On the %{nth} day of Christmas my true love gave to me, %{gifts}.\n"

  def sing
    verses(1, VERSES.size)
  end

  def verses(from, to)
    (from..to).map { |n| verse(n) }.join("\n") + "\n"
  end

  def verse(n)
    verse_index      = n.pred
    verse_definition = VERSES[verse_index]
    TEMPLATE % {nth: verse_definition.nth, gifts: gifts(verse_index)}
  end

  private

  def gifts(verse_index)
    s = ""
    verse_index.downto(1) do |n|
      s += VERSES[n].gift + ", "
    end
    s += "and " unless s.empty?
    s += VERSES[0].gift
  end

end