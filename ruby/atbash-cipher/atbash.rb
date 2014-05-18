module Atbash

  def self.encode(plaintext)
    group_letters(cipher(sanitize(plaintext)))
  end

  private

  PLAIN  = ('a'..'z').to_a.join
  CIPHER = PLAIN.reverse
  IGNORE = /[^a-z\d]/

  def self.sanitize(plaintext)
    plaintext.downcase.gsub(IGNORE, '')
  end

  def self.cipher(sanitized_plaintext)
    sanitized_plaintext.tr(PLAIN, CIPHER)
  end

  def self.group_letters(string, n=5)
    g = []
    string.chars.each_slice(n) do |slice|
      g << slice.join
    end
    g.join(" ")
  end

end