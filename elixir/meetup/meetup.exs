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

  def meetup(year, month, weekday, :second) do
    advance_to_first({year, month, 1}, weekday) |> advance_date_by_weeks(1)
  end

  def meetup(year, month, weekday, :third) do
    advance_to_first({year, month, 1}, weekday) |> advance_date_by_weeks(2)
  end

  def meetup(year, month, weekday, :fourth) do
    advance_to_first({year, month, 1}, weekday) |> advance_date_by_weeks(3)
  end

  def meetup(year, month, weekday, :last) do
    advance_to_first({year, month, last_day_of_month(year, month) - 6}, weekday)
  end

  def meetup(year, month, weekday, :teenth) do
    advance_to_first({year, month, 13}, weekday)
  end

  defp advance_date_by_weeks({year, month, day}, weeks) do
    {year, month, day + weeks * 7}
  end

  defp advance_to_first(date, weekday) do
    from_weekday   = weekday_number(weekday)
    to_weekday     = date_weekday_number(date)
    offset_in_days = weekdays_between(from_weekday, to_weekday)
    if offset_in_days == 0 do
      date
    else
      date
      |> date_to_epoch
      |> advance_epoch_by_days(offset_in_days)
      |> epoch_to_date
    end
  end

  @day_seconds 24 * 60 * 60

  defp advance_epoch_by_days(epoch, days) do
    epoch + days * @day_seconds
  end

  defp date_to_epoch(date) do
    :calendar.datetime_to_gregorian_seconds({date, {0, 0, 0}})
  end

  defp epoch_to_date(epoch) do
    {date, _} = :calendar.gregorian_seconds_to_datetime(epoch)
    date
  end

  defp weekdays_between(from_weekday, to_weekday) do
    rem(7 - (to_weekday - from_weekday), 7)
  end

  defp last_day_of_month(year, month) do
    :calendar.last_day_of_the_month(year, month)
  end

  defp date_weekday_number(date) do
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
