defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    _to_decimal(string, 0)
  end

  defp _to_decimal("", acc), do: acc
  defp _to_decimal("0" <> tail, acc), do: _to_decimal(tail, shift(acc))
  defp _to_decimal("1" <> tail, acc), do: _to_decimal(tail, shift(acc) + 1)
  defp _to_decimal(_, _acc), do: 0

  defp shift(acc), do: 2 * acc

end
