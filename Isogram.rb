module Isogram
  def self.isogram?(input)
    chars = Set.new
    input.each_char do |c|
      unless c == " " or c == "-"
        if chars.include?(c.downcase)
          return false
        end
        chars << c.downcase
      end
    end
    true
  end
end

p Isogram.isogram?("lumberjacks")
p Isogram.isogram?("background")
p Isogram.isogram?("downstream")
p Isogram.isogram?("six-year-old")
p Isogram.isogram?("isograms")