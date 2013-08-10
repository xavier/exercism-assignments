class Bob:

  def hey(self, sentence):
    interpreter = SentenceInterpreter(sentence)
    if interpreter.is_silence():
      return "Fine, be that way."
    elif interpreter.is_question():
      return "Sure."
    elif interpreter.is_shouting():
      return "Woah, chill out!"
    return "Whatever."

class SentenceInterpreter:

  def __init__(self, sentence):
    self.sentence = sentence or ""

  def is_silence(self):
    return self.sentence == ""

  def is_question(self):
    return self.sentence.endswith("?")

  def is_shouting(self):
    return self.sentence == self.sentence.upper()