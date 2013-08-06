class Phrase

  def initialize(string)
    @string = string
  end

  def word_count
    OccurrenceCounter.for(normalized_words).to_hash
  end

  private

  WORDS = /\w+/

  def normalized_words
    normalized_string.scan(WORDS)
  end

  def normalized_string
    @string.downcase
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