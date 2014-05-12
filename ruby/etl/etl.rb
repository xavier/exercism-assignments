require 'minitest/autorun'


module ETL

  extend self

  def transform(input)
    input.each_with_object({}) do |(key, values), h|
      transformed_key_values(key, values).each do |new_key, new_value|
        h[new_key] = new_value
      end
    end
  end

  private

  def transformed_key_values(key, values)
    values.map { |value| [value_to_key(value), key] }
  end

  def value_to_key(value)
    value.downcase
  end

end