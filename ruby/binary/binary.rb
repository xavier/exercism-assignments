
class Binary

  def initialize(bits)
    @bits = bits
  end

  def to_decimal
    decimal_value = 0
    @bits.chars.each_with_index do |bit, position|
      case bit
      when "1"
        decimal_value += 1 << (@bits.size-position-1)
      when "0"
      else
        return 0
      end
    end
    decimal_value
  end

end