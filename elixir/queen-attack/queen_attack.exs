defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new(nil | list) :: Queens.t()
  def new(positions \\ nil) do
    case positions do
      nil ->
        %Queens{black: {7, 3}, white: {0, 3}}
      positions ->
        %Queens{
          black: Keyword.get(positions, :black),
          white: Keyword.get(positions, :white)
        } |> ensure_different_positions!
    end
  end

  defp ensure_different_positions!(%{black: _pos, white: _pos}), do: raise ArgumentError
  defp ensure_different_positions!(positions), do: positions

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    0..7
    |> Enum.map(fn (row) -> row_to_string(row, queens) end)
    |> Enum.join("\n")
  end

  defp row_to_string(row, queens) do
    0..7
    |> Enum.map(fn (col) -> square_to_string({row, col}, queens) end)
    |> Enum.join(" ")
  end

  defp square_to_string({row, col}, %{white: {row, col}}), do: "W"
  defp square_to_string({row, col}, %{black: {row, col}}), do: "B"
  defp square_to_string(_, _), do: "_"

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%{white: {row, _}, black: {row, _}}), do: true
  def can_attack?(%{white: {_, col}, black: {_, col}}), do: true
  def can_attack?(%{white: {row_w, col_w}, black: {row_b, col_b}}) do
    row_d = abs(row_w - row_b)
    col_d = abs(col_w - col_b)
    row_d == col_d
  end
end
