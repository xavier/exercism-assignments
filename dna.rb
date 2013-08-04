class DNA

  THYMINE = 'T'
  URACIL  = 'U'

  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def to_rna
    strand.tr(THYMINE, URACIL)
  end

end