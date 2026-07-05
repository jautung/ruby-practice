module EliudsEggs
  def self.egg_count(count)
    total = 0
    while count > 0
      if count % 2 == 1
        total += 1
      end
      count = (count / 2).floor
    end
    total
  end
end

p EliudsEggs.egg_count(0)
p EliudsEggs.egg_count(16)
p EliudsEggs.egg_count(89)
p EliudsEggs.egg_count(2_000_000_000)