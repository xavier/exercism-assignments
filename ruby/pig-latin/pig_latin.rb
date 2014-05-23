module PigLatin

  class Word

    def initialize(english_word)
      @english_word = english_word
    end

    def to_s
      case
      when starts_with?("xr")       then add_suffix
      when starts_with?("ye")       then add_suffix_to(swap_match_groups(/\A(y)(e.*)/))
      when starts_with_vowel_sound? then add_suffix
      else
        add_suffix_to(swap_match_groups(/\A(thr|s?qu|[^aeiouy]+)(.*)/))
      end
    end

    private

    def starts_with?(prefix)
      @english_word.start_with?(prefix)
    end

    def starts_with_vowel_sound?
      @english_word =~ /\A[aeiouy]/
    end

    def add_suffix
      add_suffix_to(@english_word)
    end

    def add_suffix_to(word)
      "#{word}ay"
    end

    def swap_match_groups(regex)
      @english_word.gsub(regex, '\2\1')
    end

  end

  def self.translate(english_text)
    english_text.
      split.
      map { |english_word| Word.new(english_word).to_s }.
      join(" ")
  end

end