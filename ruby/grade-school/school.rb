class School

  attr_reader :name

  def initialize(name)
    @name = name
    @db   = Database.new
  end

  def db
    @db.to_hash
  end

  def add(student, grade_number)
    @db[grade_number] << student
  end

  def grade(grade_number)
    @db[grade_number]
  end

  def sort
    @db.sorted_keys.each_with_object({}) do |grade_number, sorted|
      sorted[grade_number] = grade(grade_number).sort
    end
  end

end

class Database

  def initialize
    @db = Hash.new { |hash, key| hash[key] = [] }
  end

  def []=(key, value)
    @db[key] = value
  end

  def [](key)
    @db[key]
  end

  def sorted_keys
    @db.keys.sort
  end

  def to_hash
    @db
  end

end