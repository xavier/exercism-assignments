defmodule Acronym do

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    ~r/\b([A-Za-z])|[a-z]([A-Z])/
    |> Regex.scan(string)
    |> Enum.map(fn (match) -> List.last(match) end)
    |> Enum.join
    |> String.upcase
  end
end
