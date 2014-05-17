class Clock

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def initialize(hour, minute)
    @minutes = hour*60 + minute
  end

  def +(minutes_to_add)
    advance(minutes_to_add)
  end

  def -(minutes_to_subtract)
    advance(-minutes_to_subtract)
  end

  def to_s
    "%02d:%02d" % [hour, minute]
  end

  def ==(other)
    to_s == other.to_s
  end

  protected

  def hour
    (@minutes / 60) % 24
  end

  def minute
    @minutes % 60
  end

  def advance(minutes_to_add)
    Clock.new(hour, minute + minutes_to_add)
  end

end