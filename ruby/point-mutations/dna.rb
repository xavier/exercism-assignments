class DNA

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    nucleotide_sequence_pair(other_sequence).different.count
  end

  private

  def nucleotide_sequence_pair(other_sequence)
    NucleotidePairs.new(nucleotides(@sequence), nucleotides(other_sequence))
  end

  def nucleotides(seq)
    seq.chars
  end

end

class NucleotidePairs

  def initialize(seq1, seq2)
    @seq1, @seq2 = seq1, seq2
  end

  def different
    comparable.select { |n1, n2| n1 != n2 }
  end

  def comparable
    pairs.first(comparable_length)
  end

  def comparable_length
    [@seq1.size, @seq2.size].min
  end

  def pairs
    @seq1.zip(@seq2)
  end

end
