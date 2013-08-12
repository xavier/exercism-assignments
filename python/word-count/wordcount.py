import re

class Phrase:

  WORDS = re.compile('\w+')

  def __init__(self, text):
    self.text = text

  def word_count(self):
    return OccurrenceCounter().count_all(self._normalized_words()).dict()

  def _normalized_words(self):
    return Phrase.WORDS.findall(self._normalized_text())

  def _normalized_text(self):
    return self.text.lower()

class OccurrenceCounter:

  def __init__(self):
    self.counters = {}

  def count_all(self, items):
    for item in items:
      self.count(item)
    return self

  def count(self, item):
    self.counters[item] = self.counters.get(item, 0) + 1
    return self

  def dict(self):
    return self.counters