class DNA

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    different_nucleotide_pairs(@sequence, other_sequence).count
  end

  private

  def different_nucleotide_pairs(seq1, seq2)
    comparable_nucleotide_pairs(seq1, seq2).select { |n1, n2| n1 != n2 }
  end

  def comparable_nucleotide_pairs(seq1, seq2)
    comparable_sequence_length = [seq1.size, seq2.size].min
    nucleotide_pairs(seq1, seq2).first(comparable_sequence_length)
  end

  def nucleotide_pairs(seq1, seq2)
    nucleotides(seq1).zip(nucleotides(seq2))
  end

  def nucleotides(seq)
    seq.chars
  end

end