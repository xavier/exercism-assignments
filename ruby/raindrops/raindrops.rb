module Raindrops

  WORDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(n)
    words = raindrop_words(n)
    words.empty? ? n.to_s : words
  end

  private

  def self.raindrop_words(n)
    WORDS.each_with_object("") do |(prime_factor, word), words|
      words << word if (n % prime_factor).zero?
    end
  end

end