defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    String.codepoints(string) |> Enum.reduce 0, &accumulate_bits/2
  end

  defp accumulate_bits(bit, accumulator) do
    accumulator * 2 + bit_value(bit)
  end

  defp bit_value("1"), do: 1
  defp bit_value(_),   do: 0

end
