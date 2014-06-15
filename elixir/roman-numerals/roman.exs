defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t

  @roman_numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"},
  ]

  def numerals(n) do
    _numerals(n, @roman_numerals)
  end

  defp _numerals(_, []), do: ""
  defp _numerals(n, [{value, numeral}|tail]) do
    String.duplicate(numeral, div(n, value)) <> _numerals(rem(n, value), tail)
  end

end
