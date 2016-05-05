defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints
    |> balanced?
  end

  defp balanced?(list), do: balanced?(list, [])

  defp balanced?([], []), do: true
  defp balanced?([], _),  do: false
  defp balanced?([c|rest], stack) when c in ["(", "[", "{"], do: balanced?(rest, [c|stack])
  defp balanced?([")"|rest], ["("|stack]), do: balanced?(rest, stack)
  defp balanced?(["]"|rest], ["["|stack]), do: balanced?(rest, stack)
  defp balanced?(["}"|rest], ["{"|stack]), do: balanced?(rest, stack)
  defp balanced?([c|_], _) when c in [")", "]", "}"], do: false
  defp balanced?([_|rest], stack), do: balanced?(rest, stack)

end
