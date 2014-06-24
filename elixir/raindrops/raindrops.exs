defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    handle_non_translatable(raindrops(number), number)
  end

  @vocabulary [{3 , "Pling"}, {5, "Plang"}, {7, "Plong"}]

  defp raindrops(number) do
    translate = fn
      ({factor, word}, translation)
        when rem(number, factor) == 0 -> translation <> word
      (_, translation) -> translation
    end
    Enum.reduce @vocabulary, "", translate
  end

  defp handle_non_translatable("", number),          do: to_string(number)
  defp handle_non_translatable(translation, number), do: translation

end
