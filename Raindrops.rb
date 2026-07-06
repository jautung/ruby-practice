module Raindrops
  def self.convert(num)
    result = ""
    if num % 3 == 0
      result += "Pling"
    end
    if num % 5 == 0
      result += "Plang"
    end
    if num % 7 == 0
      result += "Plong"
    end
    (result == "") ? num.to_s : result
  end
end

p Raindrops.convert(1)
p Raindrops.convert(3)
p Raindrops.convert(5)
p Raindrops.convert(7)
p Raindrops.convert(6)