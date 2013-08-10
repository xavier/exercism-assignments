class Bob

  def hey(message)
    analyzer = MessageAnalyzer.new(message)
    case
    when analyzer.silence?
      "Fine. Be that way!"
    when analyzer.shouting?
      "Woah, chill out!"
    when analyzer.question?
      "Sure."
    else
      "Whatever."
    end
  end

end

class MessageAnalyzer

  attr_reader :message

  def initialize(message)
    @message = message.to_s
  end

  def silence?
    message.empty?
  end

  def shouting?
    message == message.upcase
  end

  def question?
    message.end_with?("?")
  end

end