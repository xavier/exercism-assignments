module Raindrops

  WORDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(n)
    conversion = WORDS.reduce("") { |s, (prime_factor, word)| (n % prime_factor).zero? ? s + word : s }
    conversion.empty? ? n.to_s : conversion
  end

end