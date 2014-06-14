defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    sanitize(word)
    |> String.codepoints
    |> Enum.reduce(0, fn letter, total -> total + letter_score(letter) end)
  end

  defp sanitize(word) do
    word |> String.upcase |> strip_spaces
  end

  defp strip_spaces(word) do
    Regex.replace(~r/\s+/, word, "")
  end

  defp letter_score(letter) do
    cond do
      String.contains?("AEIOULNRST", letter) -> 1
      String.contains?("DG", letter)         -> 2
      String.contains?("BCMP", letter)       -> 3
      String.contains?("FHVWY", letter)      -> 4
      String.contains?("K", letter)          -> 5
      String.contains?("JX", letter)         -> 8
      String.contains?("QZ", letter)         -> 10
    end
  end

end
