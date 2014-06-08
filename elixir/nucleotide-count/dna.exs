defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count strand, fn (n) -> n == nucleotide end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  Enum.into [{?A, 4}, {?T, 1}, {?C, 0}, {?G, 0}], HashDict.new
  """
  @spec nucleotide_counts([char]) :: HashDict.t
  def nucleotide_counts(strand) do
    Enum.reduce strand, nucleotide_counters, &count_nucleotide/2
  end

  defp count_nucleotide(nucleotide, counters) do
    Dict.update!(counters, nucleotide, &(&1 + 1))
  end

  defp nucleotide_counters do
    Enum.into @nucleotides, HashDict.new, &({&1, 0})
  end
end
