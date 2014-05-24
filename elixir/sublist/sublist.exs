defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, b) do
    cond do
      a === b           -> :equal
      _sublist?(a, b)   -> :sublist
      _superlist?(a, b) -> :superlist
      true              -> :unequal
    end
  end

  defp _sublist?([], _), do: true
  defp _sublist?(_, []), do: false
  defp _sublist?(a = [head_of_a|tail_of_a], [head_of_b|tail_of_b]) when head_of_a === head_of_b do
    if tail_of_a === Enum.take(tail_of_b, Enum.count(a)-1) do
      true
    else
      _sublist?(a, tail_of_b)
    end
  end
  defp _sublist?(a, [head_of_b|tail_of_b]), do: _sublist?(a, tail_of_b)

  def _superlist?(a, b), do: _sublist?(b, a)

end

