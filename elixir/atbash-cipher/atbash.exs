defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> sanitize
    |> cipher
    |> format
  end

  @rejected_characters ~r/[^a-z\d]/

  defp sanitize(string) do
    Regex.replace(@rejected_characters, String.downcase(string), "")
  end

  defp cipher(sanitized_string) do
    to_string(Enum.map to_char_list(sanitized_string), &cipher_char/1)
  end

  @cipher_range ?a..?z

  defp cipher_char(char_code) when char_code in @cipher_range do
    @cipher_range.last - (char_code - @cipher_range.first)
  end
  defp cipher_char(char_code), do: char_code

  defp format(string) do
    String.strip(Regex.replace(~r/(.....)/, string, "\\1 "))
  end

end
