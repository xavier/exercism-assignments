defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map()
  def generate(max_factor, min_factor \\ 1) do
    Enum.group_by(
      palindrome_product_factors(max_factor, min_factor),
      fn ([i, j]) -> i * j end
    )
  end

  defp palindrome_product_factors(max_factor, min_factor) do
    for i <- min_factor..max_factor,
        j <- min_factor..i,
        palindrome?(to_string(i * j)), do: Enum.sort([i, j])
  end

  defp palindrome?(string) do
    string == String.reverse(string)
  end

end
