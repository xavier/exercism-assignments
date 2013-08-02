class Bob

  def hey(message)
    analizer = MessageAnalizer.new(message)
    case
      when analizer.silence?
        "Fine. Be that way!"
      when analizer.shouting?
        "Woah, chill out!"
      when analizer.question?
        "Sure."
      else
        "Whatever."
    end
  end

end

class MessageAnalizer

  attr_reader :message

  def initialize(message)
    @message = message.to_s
  end

  def silence?
    message.empty?
  end

  def shouting?
    message == @message.upcase
  end

  def question?
    message.end_with?("?")
  end

end