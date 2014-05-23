class Cipher

  BASE = 'a'.ord

  attr_reader :key

  def initialize(key = nil)
    if key
      ensure_key_is_valid!(key)
    else
      @key = generate_random_key
    end
  end

  def encode(plain_text)
    transform_with_key(plain_text) { |c, k| c + k }
  end

  def decode(obfuscated)
    transform_with_key(obfuscated) { |c, k| c - k }
  end

  private

  def ensure_key_is_valid!(key)
    raise ArgumentError unless key =~ /[a-z]+/
  end

  def generate_random_key
    (BASE + Random.rand(26)).chr * 100
  end


  def bytes(string)
    string.chars.map { |c| c.ord - BASE }
  end

  def transform_with_key(string, &block)
    bytes(string).zip(bytes(key)).map do |c, k|
      (BASE + block.(c, k)).chr
    end.join
  end

end