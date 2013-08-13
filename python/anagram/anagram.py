class Anagram:
  def __init__(self, word):
    self.comparable_word = self._comparable(word)

  def match(self, words):
    return filter(self._is_anagram, words)

  def _comparable(self, word):
    return sorted(word.lower())

  def _is_anagram(self, candidate):
    return self.comparable_word == self._comparable(candidate)

