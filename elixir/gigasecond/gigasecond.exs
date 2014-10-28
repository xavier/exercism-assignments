defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

  @seconds 1_000_000_000

	def from(date = {_year, _month, _day}) do
    date |> date_to_seconds |> advance |> seconds_to_date
	end

  defp date_to_seconds(date) do
    :calendar.datetime_to_gregorian_seconds({date, {0, 0, 0}})
  end

  defp advance(seconds) do
    seconds + @seconds
  end

  defp seconds_to_date(seconds) do
    {date, _} = :calendar.gregorian_seconds_to_datetime(seconds)
    date
  end

end