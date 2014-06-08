defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, b) do
    cond do
      a === b          -> :equal
      sublist?(a, b)   -> :sublist
      superlist?(a, b) -> :superlist
      true             -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a = [head_of_a|tail_of_a], [head_of_b|tail_of_b]) when head_of_a === head_of_b do
    if tail_of_a === Enum.take(tail_of_b, Enum.count(tail_of_a)) do
      true
    else
      sublist?(a, tail_of_b)
    end
  end
  defp sublist?(a, [head_of_b|tail_of_b]), do: sublist?(a, tail_of_b)

  def superlist?(a, b), do: sublist?(b, a)

end

