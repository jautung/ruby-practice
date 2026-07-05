class Phrase
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def word_count
    parts = value.split(/[^a-zA-Z0-9']/)
      .map { |p| p.downcase }
      .map { |p| Phrase.strip_apostrophes(p) }
      .select { |p| p.length > 0 }
    counts = {}
    parts.each do |p|
      if counts.key?(p)
        counts[p] += 1
      else
        counts[p] = 1
      end
    end
    counts
  end

  def self.strip_apostrophes(word)
    while word[0] == "'"
      word = word.slice(1..)
    end
    while word[-1] == "'"
      word = word.slice(...-1)
    end
    word
  end
end

p Phrase.new("\"That's the password: 'PASSWORD 123'!\", cried the Special Agent.\nSo I fled.").word_count
p Phrase.new("'First: don't laugh. Then: don't cry. You're getting it.'").word_count
