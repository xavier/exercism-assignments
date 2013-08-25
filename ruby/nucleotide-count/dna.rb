module Nucleotides

  IN_DNA = %w(A C G T)
  IN_RNA = %w(A C G U)
  ALL    = IN_DNA | IN_RNA

  def self.valid?(nucleotide)
    ALL.include?(nucleotide)
  end

end

class DNA

  def initialize(sequence)
    @sequence = sequence
  end

  def count(nucleotide)
    raise ArgumentError unless Nucleotides.valid?(nucleotide)
    @sequence.count(nucleotide)
  end

  def nucleotide_counts
    nucleotides.each_with_object(nucleotide_counters) do |nucleotide, counters|
      counters[nucleotide] += 1
    end
  end

  private

  def nucleotides
    @sequence.chars
  end

  def nucleotide_counters
    Nucleotides::IN_DNA.each_with_object({}) { |n, h| h[n] = 0 }
  end

end