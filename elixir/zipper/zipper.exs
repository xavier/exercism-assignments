# def BinTree, value: nil, left: nil, right: nil do
#   @moduledoc """
#   A node in a binary tree.

#   `value` is the value of a node.
#   `left` is the left subtree (nil if no subtree).
#   `right` is the right subtree (nil if no subtree).
#   """
#   record_type value: any, left: BinTree.t | nil, right: BinTree.t | nil
# end

defmodule BinTree do
  defstruct value: nil, left: nil, right: nil
end

defmodule Zipper do

  defstruct focus: nil, trail: [], root: nil

  alias BinTree, as: BT
  alias __MODULE__, as: Z

  @doc """
  Get a zipper focussed on the root node.
  """
  #@spec from_tree(BT.t) :: Z.t
  def from_tree(bt) do
    %Z{focus: bt, root: bt}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  #@spec to_tree(Z.t) :: BT.t
  def to_tree(z = %Z{root: complete_tree}) do
    complete_tree
  end

  # @doc """
  # Get the value of the focus node.
  # """
  # @spec value(Z.t) :: any
  def value(z = %Z{focus: focus}) do
    focus.value
  end

  # @doc """
  # Get the left child of the focus node, if any.
  # """
  # @spec left(Z.t) :: Z.t | nil
  def left(z = %Z{focus: %BT{left: nil}, trail: trail}), do: nil
  def left(z = %Z{focus: focus, trail: trail}) do
    %Z{z | focus: focus.left, trail: [:left|trail]}
  end

  # @doc """
  # Get the right child of the focus node, if any.
  # """
  # @spec right(Z.t) :: Z.t | nil
  def right(z = %Z{focus: %BT{right: nil}, trail: trail}), do: nil
  def right(z = %Z{focus: focus, trail: trail}) do
    %Z{z | focus: focus.right, trail: [:right|trail]}
  end

  # @doc """
  # Get the parent of the focus node, if any.
  # """
  # @spec up(Z.t) :: Z.t
  def up(z) do
    %Z{z | focus: walk_up_to_parent(z.root, Enum.reverse(z.trail))}
  end

  defp walk_up_to_parent(tree, []), do: nil
  defp walk_up_to_parent(tree, [_]), do: tree
  defp walk_up_to_parent(tree, [:left|trail]), do: walk_up_to_parent(tree.left, trail)
  defp walk_up_to_parent(tree, [:right|trail]), do: walk_up_to_parent(tree.right, trail)

  # @doc """
  # Set the value of the focus node.
  # """
  # @spec set_value(Z.t, any) :: Z.t
  def set_value(z = %Z{focus: focus}, v) do
    new_focus = %BT{focus | value: v}
    %Z{z | focus: new_focus, root: rebuild(z.root, Enum.reverse(z.trail), new_focus)}
  end

  defp rebuild(tree, [], new_subtree), do: new_subtree
  defp rebuild(tree, [:left], new_subtree), do: %BT{tree | left: new_subtree}
  defp rebuild(tree, [:right], new_subtree), do: %BT{tree | right: new_subtree}
  defp rebuild(tree, [:left|trail], new_subtree), do: rebuild(tree.left, trail, new_subtree)
  defp rebuild(tree, [:right|trail], new_subtree), do: rebuild(tree.right, trail, new_subtree)

  # @doc """
  # Replace the left child tree of the focus node.
  # """
  # @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z = %Z{focus: focus}, l) do
    new_focus = %BT{focus | left: l}
    %Z{z | focus: new_focus, root: rebuild(z.root, Enum.reverse(z.trail), new_focus)}
  end

  # @doc """
  # Replace the right child tree of the focus node.
  # """
  # @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z = %Z{focus: focus}, l) do
    new_focus = %BT{focus | right: l}
    %Z{z | focus: new_focus, root: rebuild(z.root, Enum.reverse(z.trail), new_focus)}
  end
end
