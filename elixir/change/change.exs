defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    values
    |> Enum.sort
    |> break_change(amount)
  end

  defp break_change([], _), do: :error
  defp break_change([smallest_coin_value|_], amount)
    when amount < smallest_coin_value, do: :error
  defp break_change(coin_values, amount) do
    {:ok, count_coins(Enum.reverse(coin_values), amount, %{})}
  end

  defp count_coins([], _, coins), do: coins
  defp count_coins([coin_value|other_values], amount, coins) do
    coins_used  = div(amount, coin_value)
    amount_left = amount - (coins_used * coin_value)
    count_coins(other_values, amount_left, Dict.put(coins, coin_value, coins_used))
  end
end
