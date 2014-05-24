defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: HashDict.t
  def count(sentence) do
    sentence
    |> normalize
    |> words
    |> count_occurences
  end

  defp normalize(sentence) do
    sentence
    |> String.downcase
    |> String.replace("_", " ")
  end

  defp words(normalized_sentence) do
    List.flatten Regex.scan(~r/[\w-]+/, normalized_sentence)
  end

  defp count_occurences(list) do
    inc     = fn (n) -> n + 1 end
    counter = fn (word, dict) -> HashDict.update(dict, word, 1, inc) end
    Enum.reduce(list, HashDict.new, counter)
  end

end
