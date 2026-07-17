module Grains
  def self.square(num)
    raise ArgumentError if !(1..64).include?(num)
    2 ** (num - 1)
  end

  def self.total
    (1..64).sum { |n| square(n) }
  end
end