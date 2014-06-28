defmodule SumOfMultiples do

  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    1..(limit-1)
    |> filter_mutliples(factors)
    |> sum
  end

  defp filter_mutliples(numbers, factors) do
    filter_fun = fn (number) ->
      Enum.any?(factors, &(rem(number, &1) == 0))
    end
    Enum.filter(numbers, filter_fun)
  end

  defp sum(numbers) do
    Enum.reduce(numbers, 0, &Kernel.+/2)
  end


end