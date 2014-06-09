
class Say

  LARGE_ENGLISH_NUMBERS = {
    1_000_000_000 => "billion",
    1_000_000     => "million",
    1_000         => "thousand",
    100           => "hundred",
  }

  ENGLISH_NUMBERS_UP_TO_100 = {
    90  => "ninety",
    80  => "eighty",
    70  => "seventy",
    60  => "sixty",
    50  => "fifty",
    40  => "forty",
    30  => "thirty",
    20  => "twenty",
  }

  ENGLISH_NUMBERS_UP_TO_20 = {
    19  => "nineteen",
    17  => "seventeen",
    16  => "sixteen",
    15  => "fifteen",
    14  => "fourteen",
    13  => "thirteen",
    12  => "twelve",
    11  => "eleven",
    10  => "ten",
    9   => "nine",
    8   => "eight",
    7   => "seven",
    6   => "six",
    5   => "five",
    4   => "four",
    3   => "three",
    2   => "two",
    1   => "one",
    0   => "zero",
  }

  ACCEPTED_RANGE = 0...1000000000000

  def initialize(number)
    raise ArgumentError unless ACCEPTED_RANGE.include?(number)
    @number = number
  end

  def in_english
    number_to_words(@number)
  end

  private

  def number_to_words(number)
    return number_to_words_up_to_20(number)   if number < 20
    return number_to_words_up_to_100(number)  if number < 100
    number_to_words_general_case(number)
  end

  def number_to_words_up_to_20(number)
    ENGLISH_NUMBERS_UP_TO_20[number]
  end

  def number_to_words_up_to_100(number)
    words = []
    ENGLISH_NUMBERS_UP_TO_100.each do |value, word|
      occurences, number = number.divmod(value)
      words << word if occurences > 0
    end
    words << number_to_words_up_to_20(number) if number > 0
    words.join("-")
  end

  def number_to_words_general_case(number)
    words = []
    LARGE_ENGLISH_NUMBERS.each do |value, word|
      occurences, number = number.divmod(value)
      words << number_to_words(occurences) + " " + word if occurences > 0
    end
    words << number_to_words(number) if number > 0
    words.join(" ")
  end

end