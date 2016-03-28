defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(&line_to_row/1)
  end

  defp line_to_row(line) do
    line
    |> String.split
    |> Enum.map(fn (str) -> str |> Integer.parse |> elem(0) end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> transpose_square_matrix
  end

  defp transpose_square_matrix(matrix) do
    range = 0..(length(matrix)-1)
    Enum.map(range, fn (j) ->
      Enum.map(range, fn(i) ->
        matrix |> Enum.at(i) |> Enum.at(j)
      end)
    end)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    matrix   = rows(str)
    t_matrix = columns(str)

    matrix
    |> length
    |> coordinates
    |> Enum.filter(fn ({i, j}) ->
      col = Enum.at(t_matrix, j)
      row = Enum.at(matrix, i)
      saddle?(row, j, &Kernel.>=/2) && saddle?(col, i, &Kernel.<=/2)
    end)
  end

  defp saddle?(vector, i, cmp_fun) do
    x = Enum.at(vector, i)
    vector
    |> Enum.with_index
    |> Enum.all?(fn ({y, j}) -> (i == j) || cmp_fun.(x, y) end)
  end

  defp coordinates(order) do
    range = 0..(order-1)
    for i <- range, j <- range, do: {i, j}
  end

end
