from collections import Counter

class DNA:

  COUNTABLE_NUCLEOTIDES = "ACGTU"

  def __init__(self, sequence):
    self.sequence = sequence

  def count(self, nucleotide):
    if nucleotide in DNA.COUNTABLE_NUCLEOTIDES:
      return self._counter()[nucleotide]
    else:
      raise ValueError, ("%s is not a nucleotide." % nucleotide)

  def nucleotide_counts(self):
    counts = self._default_nucleotide_counts()
    counts.update(self._counter())
    return counts

  def _counter(self):
    return Counter(self.sequence)

  def _default_nucleotide_counts(self):
    return {"A": 0, "C": 0, "G": 0, "T": 0}