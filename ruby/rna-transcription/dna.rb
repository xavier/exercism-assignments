DNA = Struct.new(:strand) do

  THYMINE = 'T'
  URACIL  = 'U'

  def to_rna
    strand.tr(THYMINE, URACIL)
  end

end