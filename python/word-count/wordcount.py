import re
import collections

class Phrase:

  WORDS = re.compile('\w+')

  def __init__(self, text):
    self.text = text

  def word_count(self):
    return dict(collections.Counter(self._normalized_words()))

  def _normalized_words(self):
    return Phrase.WORDS.findall(self._normalized_text())

  def _normalized_text(self):
    return self.text.lower()
