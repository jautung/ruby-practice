# module PythagoreanTriplet
#   def self.triplets_with_sum(target_sum)
#     return [] if target_sum <= 0
#     results = []
#     (1..(target_sum.to_f / 3).ceil).each do |a|
#       ((a + 1)..(target_sum - a)).each do |b|
#         c = target_sum - a - b
#         if c <= b || a ** 2 + b ** 2 > c ** 2
#           break
#         end
#         next if a ** 2 + b ** 2 != c ** 2
#         results << [a, b, c]
#       end
#     end
#     results
#   end
# end

module PythagoreanTriplet
  def self.triplets_with_sum(target_sum)
    return [] if target_sum <= 0
    results = []
    (1..(target_sum.to_f / 3).ceil).each do |a|
      maybe_b_numerator = (target_sum - a) ** 2 - a ** 2
      maybe_b_denominator = 2 * (target_sum - a)
      next if maybe_b_numerator % maybe_b_denominator != 0
      maybe_b = maybe_b_numerator / maybe_b_denominator
      next if maybe_b <= a
      b = maybe_b
      c = target_sum - a - b
      next if c <= b
      results << [a, b, c]
    end
    results
  end
end

p PythagoreanTriplet.triplets_with_sum(12)
p PythagoreanTriplet.triplets_with_sum(108)
p PythagoreanTriplet.triplets_with_sum(90)
p PythagoreanTriplet.triplets_with_sum(30_000)