require 'minitest/autorun'


module ETL

  def self.transform(input)
    input.each_with_object({}) do |(key, values), h|
      transformed_key_values(key, values).each do |new_key, new_value|
        h[new_key] = new_value
      end
    end
  end

  def self.transformed_key_values(key, values)
    values.map { |value| [value_to_key(value), key] }
  end

  def self.value_to_key(value)
    value.downcase
  end

end

class TransformTest < MiniTest::Unit::TestCase

  def test_transform_one_value
    old = { 'hello' => ['WORLD'] }
    expected = { 'world' => 'hello' }

    assert_equal expected, ETL.transform(old)
  end

  def test_transform_more_values
    old = { 'hello' => ['WORLD', 'GSCHOOLERS'] }
    expected = { 'world' => 'hello', 'gschoolers' => 'hello' }

    assert_equal expected, ETL.transform(old)
  end

  def test_more_keys
    old = { 'a' => ['APPLE', 'ARTICHOKE'], 'b' => ['BOAT', 'BALLERINA'] }
    expected = {
      'apple' => 'a',
      'artichoke' => 'a',
      'boat' => 'b',
      'ballerina' => 'b'
    }

    assert_equal expected, ETL.transform(old)
  end

  def test_full_dataset

    old = {
      1 => %W(A E I O U L N R S T),
      2 => %W(D G),
      3 => %W(B C M P),
      4 => %W(F H V W Y),
      5 => %W(K),
      8 => %W(J X),
      10 => %W(Q Z),
    }

    expected = {
      "a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1,
      "f" => 4, "g" => 2, "h" => 4, "i" => 1, "j" => 8,
      "k" => 5, "l" => 1, "m" => 3, "n" => 1, "o" => 1,
      "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1,
      "u" => 1, "v" => 4, "w" => 4, "x" => 8, "y" => 4,
      "z" => 10
    }

    assert_equal expected, ETL.transform(old)
  end

end