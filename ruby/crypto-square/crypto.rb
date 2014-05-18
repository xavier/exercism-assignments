class Crypto

  IGNORE = /[^a-z\d]/

  def initialize(plaintext)
    @plain_text = plaintext
  end

  def normalize_plaintext
    @normalize_plaintext ||= @plain_text.downcase.gsub(IGNORE, '')
  end

  def size
    @size ||= Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    @plaintext_segments ||= build_plaintext_segments
  end

  def ciphertext
    (0..size).map do |column|
      plaintext_segments.map do |segment|
        segment.chars[column]
      end.join
    end.join
  end

  def normalize_ciphertext
    group_letters(ciphertext)
  end

  private

  def build_plaintext_segments
    segments = []
    normalize_plaintext.chars.each_slice(size) do |chars_in_segment|
      segments << chars_in_segment.join
    end
    segments
  end

  def group_letters(string, n=5)
    groups = []
    string.chars.each_slice(n) do |slice|
      groups << slice.join
    end
    groups.join(" ")
  end

end