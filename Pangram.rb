module Pangram
  def self.pangram?(sentence)
    sentence.chars.map { |c| c.downcase }.select { |c| /[a-z]/.match?(c) }.to_set.size == 26
  end
end

p Pangram.pangram?('')
p Pangram.pangram?('abcdefghijklmnopqrstuvwxyz')
p Pangram.pangram?('the quick brown fox jumps over the lazy dog')
p Pangram.pangram?('a quick movement of the enemy will jeopardize five gunboats')
p Pangram.pangram?('five boxing wizards jump quickly at it')
p Pangram.pangram?('the_quick_brown_fox_jumps_over_the_lazy_dog')
p Pangram.pangram?('the 1 quick brown fox jumps over the 2 lazy dogs')
p Pangram.pangram?('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog')
p Pangram.pangram?('"Five quacking Zephyrs jolt my wax bed."')
p Pangram.pangram?('abcdefghijklm ABCDEFGHIJKLM')