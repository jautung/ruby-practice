class InvalidCodonError < StandardError
end

module Translation
  def self.of_rna(strand)
    curr_idx = 0
    result = []
    while curr_idx < strand.length
      codon = strand.slice(curr_idx...(curr_idx+3))
      maybe_amino_acid = Translation.of_codon(codon)
      break if not maybe_amino_acid
      result << maybe_amino_acid
      curr_idx += 3
    end
    result
  end

  def self.of_codon(codon)
    case codon
      when "AUG" then "Methionine"
      when "UUU", "UUC" then "Phenylalanine"
      when "UUA", "UUG" then "Leucine"
      when "UCU", "UCC", "UCA", "UCG" then "Serine"
      when "UAU", "UAC" then "Tyrosine"
      when "UGU", "UGC" then "Cysteine"
      when "UGG" then "Tryptophan"
      when "UAA", "UAG", "UGA" then nil
      else raise InvalidCodonError
    end
  end
end

p Translation.of_rna("AUGUUUUCU")
p Translation.of_rna("AUGUUUUCUUAAAUG")
# p Translation.of_rna("AAA")