class School

  attr_reader :name, :db

  def initialize(name)
    @name = name
    @db   = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(student, grade_number)
    db[grade_number] << student
  end

  def grade(grade_number)
    db[grade_number]
  end

  def sort
    sorted_grade_numbers.each_with_object({}) do |grade_number, sorted|
      sorted[grade_number] = grade(grade_number).sort
    end
  end

  private

  def sorted_grade_numbers
    db.keys.sort
  end

end