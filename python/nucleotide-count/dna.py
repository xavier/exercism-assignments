from collections import Counter

class DNA:

  COUNTABLE_NUCLEOTIDES = "ACGTU"

  def __init__(self, sequence):
    self.counter = Counter(sequence)

  def count(self, nucleotide):
    if nucleotide in DNA.COUNTABLE_NUCLEOTIDES:
      return self.counter[nucleotide]
    else:
      raise ValueError, ("%s is not a nucleotide." % nucleotide)

  def nucleotide_counts(self):
    return dict(self._default_nucleotide_counts() + self.counter.items())

  def _default_nucleotide_counts(self):
    return {"A": 0, "C": 0, "G": 0, "T": 0}.items()