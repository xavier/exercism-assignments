import string

class Beer:

  NEWLINE = "\n"

  def verse(self, bottles):
    return self._assemble(Verse(bottles).lines())

  def sing(self, bottles_available, bottles_left=0):
    return self._assemble(self._verses(bottles_available, bottles_left))

  def _assemble(self, parts):
    return Beer.NEWLINE.join(parts) + Beer.NEWLINE

  def _verses(self, bottles_available, bottles_left):
    return [self.verse(b) for b in reversed(xrange(bottles_left, bottles_available+1))]

class Verse:

  def __init__(self, bottles):
    self.bottles = bottles
    self.variables = {
      "bottles_available": self._pluralized_bottles(bottles),
      "bottles_left": self._pluralized_bottles(bottles-1),
      "take_what": self._take_what()
    }

  def lines(self):
    return map(self._contextualize, [self._first_line(), self._second_line()])

  def _first_line(self):
    return "$bottles_available of beer on the wall, $bottles_available of beer."

  def _second_line(self):
    if self.bottles > 0:
      return "Take $take_what down and pass it around, $bottles_left of beer on the wall."
    else:
      return "Go to the store and buy some more, 99 bottles of beer on the wall."

  def _contextualize(self, line):
    return string.Template(line).substitute(self.variables).capitalize()

  def _pluralized_bottles(self, count):
    if count == 0:
      return "no more bottles"
    elif count == 1:
      return "1 bottle"
    else:
      return "%d bottles" % (count,)

  def _take_what(self):
    if self.bottles > 1:
      return "one"
    else:
      return "it"