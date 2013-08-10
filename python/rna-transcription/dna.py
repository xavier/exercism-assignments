class DNA:

  THYMINE = 'T'
  URACIL  = 'U'

  def __init__(self, sequence):
    self.sequence = sequence

  def to_rna(self):
    return self.sequence.replace(DNA.THYMINE, DNA.URACIL)