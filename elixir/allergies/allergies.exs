defmodule Allergies do

  use Bitwise

  @allergy_flags [
    {"cats",       128},
    {"pollen",      64},
    {"chocolate",   32},
    {"tomatoes",    16},
    {"strawberries", 8},
    {"shellfish",    4},
    {"peanuts",      2},
    {"eggs",         1},
  ]

  @allergies Enum.into(@allergy_flags, HashDict.new)

  @doc """
  List the allergies for which the corresponding flag bit is true.

  Allergies should be ordered, starting with the allergie with the least
  significant bit ("eggs").
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    Enum.reduce @allergy_flags, [], fn
      ({allergy, flag}, allergies)
        when (flags &&& flag) != 0 -> [allergy|allergies]
      (foo, allergies) -> allergies
    end
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    (flags &&& @allergies[item]) != 0
  end
end
