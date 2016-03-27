defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    hamming(strand1, strand2, 0)
  end

  defp hamming([], [], count), do: count
  defp hamming([x|strand1], [x|strand2], count), do: hamming(strand1, strand2, count)
  defp hamming([_|strand1], [_|strand2], count), do: hamming(strand1, strand2, count+1)
  defp hamming([], _, _), do: nil
  defp hamming(_, [], _), do: nil

end
