defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == "" ->
        "Fine. Be that way!"
      input == String.upcase(input) ->
        "Woah, chill out!"
      String.ends_with?(input, "?") ->
        "Sure."
      true ->
        "Whatever."
    end
  end
end
