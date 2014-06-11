defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    Enum.zip(strand1, strand2) |> Enum.reduce(0, &_calculate_distance/2)
  end

  defp _calculate_distance({_a,_a}, distance), do: distance
  defp _calculate_distance({_a,_b}, distance), do: distance + 1

end
