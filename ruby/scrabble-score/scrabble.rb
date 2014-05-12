class Scrabble

  class ScoreTable

    def initialize(letters_to_score_map)
      @scores = build_scores(letters_to_score_map)
    end

    def [](letter)
      @scores.fetch(letter, 0)
    end

    private

    def build_scores(letters_to_score_map)
      letters_to_score_map.each_with_object({}) do |(letters, score), scores|
        letters.each { |letter| scores[letter] = score }
      end
    end

  end

  LETTER_SCORE = ScoreTable.new(
    %w{A E I O U L N R S T} => 1,
    %w{D G}                 => 2,
    %w{B C M P}             => 3,
    %w{F H V W Y}           => 4,
    %w{K}                   => 5,
    %w{J X}                 => 8,
    %w{Q Z}                 => 10,
  )

  def initialize(word)
    @letters = word.to_s.upcase.split('')
  end

  def score
    @letters.reduce(0) { |sum, letter| sum + LETTER_SCORE[letter] }
  end

  def self.score(word)
    new(word).score
  end

end