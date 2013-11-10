import re

class Phone:

  REGEX_SANITIZE = re.compile(r'[^\d]')
  REGEX_STRIP_1  = re.compile(r'\A1(\d{10})\Z')
  REGEX_PARTS    = re.compile(r'\A(\d{3})(\d{3})(\d{4})\Z')
  INVALID        = ("000", "000", "0000")
  PRETTY_FORMAT  = "(%s) %s-%s"

  def __init__(self, number_string):
    self.__parts  = self.__parse(self.__clean(number_string))
    self.number = "".join(self.__parts)

  def area_code(self):
    return self.__parts[0]

  def pretty(self):
    return self.PRETTY_FORMAT % self.__parts

  def __clean(self, number_string):
    clean = self.REGEX_SANITIZE.sub("", number_string)
    clean = self.REGEX_STRIP_1.sub(r"\1", clean)
    return clean

  def __parse(self, clean_number_string):
    match = self.REGEX_PARTS.search(clean_number_string)
    if match:
      return match.groups()
    else:
      return self.INVALID