class Scrabble
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def score
    word.chars.sum { |c| Scrabble.letter_score(c.upcase) }
  end

  def self.letter_score(letter)
    case letter
      when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" then 1
      when "D", "G" then 2
      when "B", "C", "M", "P" then 3
      when "F", "H", "V", "W", "Y" then 4
      when "K" then 5
      when "J", "X" then 8
      when "Q", "Z" then 10
      else raise
    end
  end
end

p Scrabble.new('street').score
p Scrabble.new('OxyphenButazone').score