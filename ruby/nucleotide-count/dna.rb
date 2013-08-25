require "set"

module Nucleotides

  IN_DNA = Set.new(%w(A C G T))
  IN_RNA = Set.new(%w(A C G U))

end

class DNA

  COUNTABLE_NUCLEOTIDES = Nucleotides::IN_DNA + Nucleotides::IN_RNA

  def initialize(sequence)
    @sequence = sequence
  end

  def count(nucleotide)
    raise ArgumentError unless COUNTABLE_NUCLEOTIDES.include?(nucleotide)
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