defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    sieve([], initial_candidates(limit))
  end

  defp sieve(primes, []), do: primes

  defp sieve(primes, [prime|candidates]) do
    [prime|sieve(primes, reject_multiples(candidates, prime))]
  end

  defp reject_multiples(numbers, factor) do
    Enum.reject(numbers, &(rem(&1, factor) == 0))
  end

  defp initial_candidates(limit) do
    Enum.into(2..limit, [])
  end

end
