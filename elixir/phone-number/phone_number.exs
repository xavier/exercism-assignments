defmodule Phone do

  @bad_number "0000000000"

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> _number_strip_non_digits
    |> _number_strip_leading_1
    |> _number_cannot_be_too_short
    |> _number_cannot_be_too_long
  end

  defp _number_strip_non_digits(string),    do: String.replace(string, ~r/[^\d]/, "")
  defp _number_strip_leading_1(string),     do: String.replace(string, ~r/^1(\d{10})/, "\\1")
  defp _number_cannot_be_too_short(string), do: String.replace(string, ~r/^\d{11,}$/, @bad_number)
  defp _number_cannot_be_too_long(string),  do: String.replace(string, ~r/^\d{0,9}$/, @bad_number)

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw |> number |> String.slice(0..2)
  end

  # @doc """
  # Pretty print a phone number

  # Wraps the area code in parentheses and separates
  # exchange and subscriber number with a dash.

  # ## Examples

  # iex> Phone.pretty("123-456-7890")
  # "(123) 456-7890"

  # iex> Phone.pretty("+1 (303) 555-1212")
  # "(303) 555-1212"

  # iex> Phone.pretty("867.5309")
  # "(000) 000-0000"
  # """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw |> number |> String.replace(~r/^(\d{3})(\d{3})(\d{4})$/, "(\\1) \\2-\\3")
  end
end
