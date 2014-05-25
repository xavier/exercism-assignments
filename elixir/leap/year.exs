defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    cond do
      _special_century?(year) -> true
      _century?(year)         -> false
      _divisible_by_4?(year)  -> true
      true                    -> false
    end
  end

  defp _special_century?(year), do: _divisible_by?(year, 400)
  defp _century?(year),         do: _divisible_by?(year, 100)
  defp _divisible_by_4?(year),  do: _divisible_by?(year, 4)
  defp _divisible_by?(year, n), do: rem(year, n) == 0

end
