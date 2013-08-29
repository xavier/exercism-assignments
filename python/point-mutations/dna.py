from itertools import izip

class DNA:
  def __init__(self, sequence):
    self.sequence = sequence

  def hamming_distance(self, other_sequence):
    return len([True for (n1, n2) in izip(self.sequence, other_sequence) if n1 != n2])