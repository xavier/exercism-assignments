class DNA

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    comparable_nucleotide_pairs(@sequence, other_sequence).reduce(0) do |d, (n1, n2)|
      n1 != n2 ? d.succ : d
    end
  end

  private

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