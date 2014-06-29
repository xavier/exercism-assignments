defmodule Series do

  @doc """
  Splits up the given string of numbers into an array of integers.
  """
  @spec digits(String.t) :: [non_neg_integer]
  def digits(number_string) do
    number_string |> String.graphemes |> Enum.map &:erlang.binary_to_integer/1
  end

  @doc """
  Generates sublists of a given size from a given string of numbers.
  """
  @spec slices(String.t, non_neg_integer) :: [list(non_neg_integer)]
  def slices(_number_string, 0), do: []
  def slices(number_string, size) do
    Enum.chunk(digits(number_string), size, 1)
  end

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(number_string, size) do
    slices(number_string, size)
    |> Enum.map(&product/1)
    |> largest
  end

  defp product(numbers) do
    Enum.reduce(numbers, 1, &Kernel.*/2)
  end

  defp largest([]), do: 1
  defp largest(collection), do: Enum.max(collection)

end