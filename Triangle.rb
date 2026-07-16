class Triangle
  attr_reader :sides, :is_triangle

  def initialize(sides)
    if sides.length != 3
      raise
    end
    @sides = sides
    @is_triangle = basic_checks
  end

  def basic_checks
    if sides.any? { |s| s == 0 }
      return false
    end
    sides[0] + sides[1] >= sides[2] and sides[1] + sides[2] >= sides[0] and sides[2] + sides[0] >= sides[1]
  end

  def equilateral?
    is_triangle and sides.to_set.size == 1
  end

  def isosceles?
    is_triangle and sides.to_set.size <= 2
  end

  def scalene?
    is_triangle and sides.to_set.size == 3
  end
end

p Triangle.new([2, 2, 2]).equilateral?
p Triangle.new([2, 3, 2]).equilateral?
p Triangle.new([5, 4, 6]).equilateral?
p Triangle.new([0, 0, 0]).equilateral?
p Triangle.new([0.5, 0.5, 0.5]).equilateral?
p Triangle.new([3, 4, 4]).isosceles?
p Triangle.new([4, 4, 3]).isosceles?
p Triangle.new([4, 3, 4]).isosceles?
p Triangle.new([4, 4, 4]).isosceles?
p Triangle.new([2, 3, 4]).isosceles?
p Triangle.new([1, 1, 3]).isosceles?
p Triangle.new([1, 3, 1]).isosceles?
p Triangle.new([3, 1, 1]).isosceles?
p Triangle.new([0.5, 0.4, 0.5]).isosceles?
p Triangle.new([5, 4, 6]).scalene?
p Triangle.new([4, 4, 4]).scalene?
p Triangle.new([4, 4, 3]).scalene?
p Triangle.new([3, 4, 3]).scalene?
p Triangle.new([4, 3, 3]).scalene?
p Triangle.new([7, 3, 2]).scalene?
p Triangle.new([0.5, 0.4, 0.6]).scalene?