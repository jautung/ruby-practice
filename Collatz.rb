module CollatzConjecture
  def self.steps(start)
    if start <= 0
      raise ArgumentError
    end
    count = 0
    while start != 1
      if start % 2 == 0
        start = (start / 2).to_i
      else
        start = 3 * start + 1
      end
      count += 1
    end
    count
  end
end

p CollatzConjecture.steps(1)
p CollatzConjecture.steps(16)
p CollatzConjecture.steps(12)
p CollatzConjecture.steps(1_000_000)