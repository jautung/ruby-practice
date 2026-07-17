module Nucleotide
  BASES = %w[A C G T]

  def self.from_dna(str)
    raise ArgumentError if str.chars.any? { |c| !BASES.include?(c) }
    NucleotideCount.new(str)
  end
end

class NucleotideCount
  BASES = %w[A C G T]

  attr_reader :dna_str

  def initialize(dna_str)
    @dna_str = dna_str
  end

  def histogram
    results = {}
    BASES.each { |base| results[base] = 0 }
    dna_str.chars.each { |base| results[base] += 1 }
    results
  end
end

p Nucleotide.from_dna('').histogram
p Nucleotide.from_dna('G').histogram
p Nucleotide.from_dna('GGGGGGG').histogram
p Nucleotide.from_dna('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC').histogram