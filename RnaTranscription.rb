module Complement
  def self.of_dna(dna)
    dna.chars.map { |c| Complement.char_complement(c) }.join
  end

  def self.char_complement(c)
    case c
      when "G" then "C"
      when "C" then "G"
      when "T" then "A"
      when "A" then "U"
    end
  end
end

p Complement.of_dna('ACGTGGTCTTAA')