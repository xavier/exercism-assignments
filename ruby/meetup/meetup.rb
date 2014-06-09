require 'minitest/autorun'
require 'date'

class Meetup

  WEEKDAYS = {
    sunday:    0,
    monday:    1,
    tuesday:   2,
    wednesday: 3,
    thursday:  4,
    friday:    5,
    saturday:  6,
  }

  def initialize(month, year)
    @month, @year = month, year
  end

  def day(weekday, schedule)
    weekday_number = WEEKDAYS.fetch(weekday)
    case schedule
    when :first  then first(weekday_number)
    when :last   then last(weekday_number)
    when :second then nth(1, weekday_number)
    when :third  then nth(2, weekday_number)
    when :fourth then nth(3, weekday_number)
    when :teenth then teenth(weekday_number)
    end
  end

  private

  def first(weekday)
    advance_to_first(date_in_month(1), weekday)
  end

  def last(weekday)
    advance_to_first(date_in_month(-7), weekday)
  end

  def nth(week, weekday)
    advance_by_weeks(first(weekday), week)
  end

  def teenth(weekday)
    advance_to_first(date_in_month(13), weekday)
  end

  def advance_to_first(date, weekday)
    date + (weekday - date.wday) % 7
  end

  def advance_by_weeks(date, number_of_weeks)
    date + number_of_weeks * 7
  end

  def date_in_month(day_of_month)
    Date.civil(@year, @month, day_of_month)
  end

end