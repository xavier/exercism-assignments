
class School:

  def __init__(self, name):
    self.name = name
    self.db = {}

  def add(self, student, grade_number):
    students_in_grade = self.grade(grade_number)
    students_in_grade.add(student)
    self.db[grade_number] = students_in_grade

  def grade(self, grade_number):
    return self.db.get(grade_number, set())

  def sort(self):
    sorted_db = {}
    for grade_number in sorted(self.db.keys()):
      sorted_db[grade_number] = tuple(sorted(self.db[grade_number]))
    return sorted_db