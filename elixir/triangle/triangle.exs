defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }

  def kind(a, b, c)
    when (a <= 0) or (b <= 0) or (c <= 0), do: {:error, "all side lengths must be positive"}

  def kind(a, b, c)
    when not (abs(a-b) < c and c < (a+b)), do: {:error, "side lengths violate triangle inequality"}

  def kind(_a, _a, _a), do: {:ok, :equilateral}

  def kind(_a, _a, _),  do: {:ok, :isosceles}
  def kind(_, _a, _a),  do: {:ok, :isosceles}
  def kind(_a, _, _a),  do: {:ok, :isosceles}

  def kind(_a, _b, _c), do: {:ok, :scalene}

end
