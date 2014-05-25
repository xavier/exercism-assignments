defmodule School do
	@moduledoc """
	Simulate students in a school.

	Each student is in a grade.
	"""

	@doc """
	Add a student to a particular grade in school.
	"""
	@spec add(HashDict, String.t, pos_integer) :: HashDict

	def add(db, name, grade) do
		Dict.update(db, grade, [name], fn (list) -> Enum.sort [name|list] end)
	end

	@doc """
	Return the names of the students in a particular grade.
	"""
	@spec grade(HashDict, pos_integer) :: [String]

	def grade(db, grade) do
		Dict.get(db, grade, [])
	end

	@doc """
	Sorts the school by grade and name.
	"""
	@spec sort(HashDict) :: HashDict

	def sort(db) do
		Enum.sort(db) |> Enum.into(HashDict.new)
	end

end