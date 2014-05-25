defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  Examples

  iex> ETL.transform(Enum.into([{"a", ["ABILITY", "AARDVARK"]}, {"b", ["BALLAST", "BEAUTY"]}], HashDict.new))
  Enum.into [{"ability", "a"},{"aardvark","a"},{"ballast","b"},{"beauty","b"}], HashDict.new
  """
  @spec transform(Dict.t) :: HashDict.t
  def transform(input) do
    input
    |> Enum.reduce([], &_process_key_values/2)
    |> Enum.sort
    |> Enum.into(HashDict.new)
  end

  defp _process_key_values({key, values}, list) do
    Enum.reduce(values, list, fn (value, list) ->
      [{_normalize(value), key}|list]
    end)
  end

  defp _normalize(key), do: String.downcase(key)

end
