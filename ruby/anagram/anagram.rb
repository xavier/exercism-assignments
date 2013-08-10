class Anagram

  class ComparableWord

    attr_reader :comparable_sequence

    def initialize(word)
      @comparable_sequence = word.downcase.chars.sort
    end

    def anagram_of?(other)
      @comparable_sequence == other.comparable_sequence
    end

  end

  def initialize(word)
    @word = ComparableWord.new(word)
  end

  def match(candidates)
    candidates.select do |candidate|
      @word.anagram_of?(ComparableWord.new(candidate))
    end
  end

end