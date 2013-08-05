class Phrase

  def initialize(string)
    @string = string
  end

  def word_count
    OccurrenceCounter.for(normalized_words).to_hash
  end

  private

  def normalized_words
    words.map { |word| normalize_word(word) }
  end

  def normalize_word(word)
    word.downcase
  end

  SEPARATE_WORDS_WITH_SPACES_OR_PUNCTUATION = /[^\w]+/

  def words
    @string.split(SEPARATE_WORDS_WITH_SPACES_OR_PUNCTUATION)
  end

end

class OccurrenceCounter

  class <<self

    def for(collection)
      collection.each_with_object(new) { |item, counter| counter.count!(item) }
    end

  end

  def initialize
    @counters = Hash.new(0)
  end

  def count!(item)
    @counters[item] += 1
  end

  def to_hash
    @counters
  end

end