
class SecretHandshake

  COMMANDS = {
    0b00001 => -> (commands) { commands << "wink" },
    0b00010 => -> (commands) { commands << "double blink" },
    0b00100 => -> (commands) { commands << "close your eyes" },
    0b01000 => -> (commands) { commands << "jump" },
    0b10000 => -> (commands) { commands.reverse }
  }

  def initialize(number)
    @number = number.to_i
  end

  def commands
    COMMANDS.reduce([]) do |output, (bitmask, command)|
      (@number & bitmask != 0) ? command.(output) : output
    end
  end

end