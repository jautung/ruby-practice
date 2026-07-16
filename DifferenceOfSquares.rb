class Squares
  attr_reader :val

  def initialize(val)
    @val = val
  end

  def square_of_sum
    (((1 + val) * val) / 2) ** 2
  end

  def sum_of_squares
    (val) * (val + 1) * (2 * val + 1) / 6
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

p Squares.new(1).square_of_sum
p Squares.new(5).square_of_sum
p Squares.new(100).square_of_sum
p Squares.new(1).sum_of_squares
p Squares.new(5).sum_of_squares
p Squares.new(100).sum_of_squares
p Squares.new(1).difference
p Squares.new(5).difference
p Squares.new(100).difference