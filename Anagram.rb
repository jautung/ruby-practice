class Anagram
  attr_reader :base_word
  attr_reader :base_word_counts

  def initialize(base_word)
    @base_word = base_word
    @base_word_counts = Anagram.create_counts(base_word)
  end

  def match(strs)
    strs.select { |w| not same_word(w) and is_anagram(w) }
  end

  def same_word(word)
    base_word.downcase == word.downcase
  end

  def is_anagram(word)
    counts = Anagram.create_counts(word)
    base_word_counts == counts
  end

  def self.create_counts(word)
    counts = {}
    word.each_char do |char|
      char_down = char.downcase
      if counts.key?(char_down)
        counts[char_down] += 1
      else
        counts[char_down] = 1
      end
    end
    counts
  end
end

p Anagram.new('solemn').match(%w[lemons cherry melons])
p Anagram.new('allergy').match(%w[gallery ballerina regally clergy largely leading])
p Anagram.new('BANANA').match(%w[BANANA])