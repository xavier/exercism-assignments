class DNA:
  def __init__(self, sequence):
    self.sequence = sequence

  def hamming_distance(self, other_sequence):
    d = 0
    for a, b in zip(self.sequence, other_sequence):
      if a != b:
        d += 1
    return d