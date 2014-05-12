require 'minitest/autorun'
require 'date'
require 'time'

class Gigasecond

  SECONDS = 1_000_000_000

  def initialize(birth_date)
    @birth_date = birth_date.to_time
  end

  def date
    (@birth_date + SECONDS).to_date
  end

end
