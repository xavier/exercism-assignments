class DNA

  COUNTABLE_NUCLEOTIDES = %w{A C G T U}

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
    {'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0}
  end

end