defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :first) do
    advance_to_first({year, month, 1}, weekday)
  end

  def meetup(year, month, weekday, schedule) do
    {year, month, 0}
  end

  @day_seconds 24 * 60 * 60

  def advance_to_first(date, weekday) do
    from_weekday   = weekday_number(weekday)
    to_weekday     = date_weekday_number(date)
    offset_in_days = weekdays_between(from_weekday, to_weekday)
    epoch_to_date(date_to_epoch(date) + offset_in_days * @day_seconds)
  end


  def date_to_epoch(date) do
    :calendar.datetime_to_gregorian_seconds({date, {0, 0, 0}})
  end

  def epoch_to_date(epoch) do
    {date, _} = :calendar.gregorian_seconds_to_datetime(epoch)
    date
  end

  def weekdays_between(from_weekday, to_weekday) do
    rem(7 - (to_weekday - from_weekday), 7)
  end

  def date_weekday_number(date) do
    :calendar.day_of_the_week(date)
  end

  defp weekday_number(:monday),    do: 1
  defp weekday_number(:tuesday),   do: 2
  defp weekday_number(:wednesday), do: 3
  defp weekday_number(:thursday),  do: 4
  defp weekday_number(:friday),    do: 5
  defp weekday_number(:saturday),  do: 6
  defp weekday_number(:sunday),    do: 7

end
