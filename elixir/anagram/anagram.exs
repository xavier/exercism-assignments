defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates |> Enum.filter anagram_matcher(base)
  end

  defp anagram_matcher(word) do
    normalized_word = normalize(word)
    comparable_word = comparable(normalized_word)
    fn (candidate) ->
      normalized_candidate = normalize(candidate)
      normalized_candidate != normalized_word
        && comparable(normalized_candidate) == comparable_word
    end
  end

  defp normalize(word) do
    String.downcase(word)
  end

  defp comparable(normalized_word) do
    normalized_word |> String.graphemes |> Enum.sort
  end

end
