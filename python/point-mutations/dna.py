from itertools import izip

class DNA:
  def __init__(self, sequence):
    self.sequence = sequence

  def hamming_distance(self, other_sequence):
    return reduce(self._hamming_distance_accumulator, izip(self.sequence, other_sequence), 0)

  def _hamming_distance_accumulator(self, distance, pair_of_nucleotides):
    n1, n2 = pair_of_nucleotides
    if n1 == n2:
      return distance
    else:
      return distance + 1
