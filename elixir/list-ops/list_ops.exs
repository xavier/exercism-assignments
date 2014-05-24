defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically important`) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_|tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list), do: _reverse(list, [])

  defp _reverse([], reversed), do: reversed
  defp _reverse([head|tail], reversed), do: _reverse(tail, [head|reversed])

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []
  def map([head|tail], f), do: [f.(head)|map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
