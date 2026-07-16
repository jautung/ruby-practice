class SumOfMultiples
  attr_reader :bases

  def initialize(*bases)
    @bases = bases
  end

  def to(level)
    all_items = bases.map { |b| SumOfMultiples.items_to_level(b, level) }
    merged_items = Set.new
    all_items.each { |items| merged_items.merge(items) }
    merged_items.sum
  end

  def self.items_to_level(base, level)
    if base == 0
      return [0]
    end
    limit_multiple = ((level - 1).to_f / base).floor
    (1..limit_multiple).map { |m| base * m }
  end
end

p SumOfMultiples.new(0).to(1)
p SumOfMultiples.new(3, 5).to(20)
p SumOfMultiples.new(3, 5).to(15)
p SumOfMultiples.new(3, 5).to(10)
p SumOfMultiples.new(3, 5).to(100)
