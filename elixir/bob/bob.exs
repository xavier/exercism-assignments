defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input)  -> "Fine. Be that way!"
      shouting?(input) -> "Woah, chill out!"
      question?(input) -> "Sure."
      true             -> "Whatever."
    end
  end

  defp silence?(input) do
    String.strip(input) == ""
  end

  defp shouting?(input) do
    String.upcase(input) == input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

end
