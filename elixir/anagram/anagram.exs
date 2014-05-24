defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates |> Enum.filter _anagram_matcher(base)
  end

  defp _anagram_matcher(word) do
    normalized_word = _normalize(word)
    comparable_word = _make_comparable(normalized_word)
    fn (candidate) ->
      normalized_candidate = _normalize(candidate)
      normalized_candidate != normalized_word
        && _make_comparable(normalized_candidate) == comparable_word
    end
  end

  defp _normalize(word) do
    String.downcase(word)
  end

  defp _make_comparable(normalized_word) do
    normalized_word |> String.graphemes |> Enum.sort
  end

end
