########################################
# class Palindromes
#   attr_reader :max_factor, :min_factor

#   def initialize(max_factor:, min_factor: 1)
#     @max_factor = max_factor
#     @min_factor = min_factor
#     raise ArgumentError, "min must be <= max" if min_factor > max_factor
#   end

#   def generate
#     all_factors = {}
#     all_products_raw = (min_factor..max_factor).flat_map do |first_factor|
#       (first_factor..max_factor).map do |second_factor|
#         product = first_factor * second_factor
#         if all_factors.include?(product)
#           all_factors[product] << [first_factor, second_factor]
#         else
#           all_factors[product] = [[first_factor, second_factor]]
#         end
#         product
#       end
#     end

#     all_products = all_products_raw.to_set.to_a.sort

#     lowest_palindrome = nil
#     all_products.each do |product|
#       if is_palindrome?(product)
#         lowest_palindrome = product
#         break
#       end
#     end

#     highest_palindrome = nil
#     all_products.reverse.each do |product|
#       if is_palindrome?(product)
#         highest_palindrome = product
#         break
#       end
#     end

#     if lowest_palindrome.nil? || highest_palindrome.nil?
#       return {
#         smallest: { value: nil, factors: [] },
#         largest: { value: nil, factors: [] },
#       }
#     end

#     {
#       smallest: {
#         value: lowest_palindrome,
#         factors: all_factors[lowest_palindrome],
#       },
#       largest: {
#         value: highest_palindrome,
#         factors: all_factors[highest_palindrome],
#       },
#     }
#   end

#   private def is_palindrome?(number)
#     number_str = number.to_s
#     number_str == number_str.reverse
#   end
# end

########################################
# class Palindromes
#   attr_reader :max_factor, :min_factor

#   def initialize(max_factor:, min_factor: 1)
#     @max_factor = max_factor
#     @min_factor = min_factor
#     raise ArgumentError, "min must be <= max" if min_factor > max_factor
#   end

#   PalindromeData = Data.define(:value, :factors)

#   def generate
#     lowest_palindrome = PalindromeData.new(nil, [])
#     highest_palindrome = PalindromeData.new(nil, [])
#     seen_products = Set.new

#     (min_factor..max_factor).each do |first_factor|
#       (first_factor..max_factor).each do |second_factor|
#         product = first_factor * second_factor

#         next if seen_products.include?(product)
#         seen_products << product

#         next if !lowest_palindrome.value.nil? && product > lowest_palindrome.value && !highest_palindrome.value.nil? && product < highest_palindrome.value

#         next unless is_palindrome?(product)

#         if lowest_palindrome.value.nil? || product < lowest_palindrome.value
#           lowest_palindrome = PalindromeData.new(product, [[first_factor, second_factor]])
#         elsif product == lowest_palindrome.value
#           lowest_palindrome.factors << [first_factor, second_factor]
#         end

#         if highest_palindrome.value.nil? || product > highest_palindrome.value
#           highest_palindrome = PalindromeData.new(product, [[first_factor, second_factor]])
#         elsif product == highest_palindrome.value
#           highest_palindrome.factors << [first_factor, second_factor]
#         end
#       end
#     end

#     { smallest: lowest_palindrome, largest: highest_palindrome }
#   end

#   private def is_palindrome?(number)
#     number_str = number.to_s
#     number_str == number_str.reverse
#   end
# end

########################################
# class Palindromes
#   attr_reader :max_factor, :min_factor, :smallest, :largest

#   def initialize(max_factor:, min_factor: 1)
#     @max_factor = max_factor
#     @min_factor = min_factor
#     raise ArgumentError, "min must be <= max" if min_factor > max_factor
#   end

#   PalindromeData = Data.define(:value, :factors)

#   def generate
#     lowest_palindrome = PalindromeData.new(nil, [])
#     (min_factor..max_factor).each do |first_factor|
#       (first_factor..max_factor).each do |second_factor|
#         product = first_factor * second_factor

#         break if !lowest_palindrome.value.nil? && product > lowest_palindrome.value

#         next unless is_palindrome?(product)
        
#         if lowest_palindrome.value.nil? || product < lowest_palindrome.value
#           lowest_palindrome = PalindromeData.new(product, [[first_factor, second_factor]])
#         elsif product == lowest_palindrome.value
#           lowest_palindrome.factors << [first_factor, second_factor]
#         end        
#       end
#     end
    
#     highest_palindrome = PalindromeData.new(nil, [])
#     (min_factor..max_factor).reverse_each do |first_factor|
#       (first_factor..max_factor).reverse_each do |second_factor|
#         product = first_factor * second_factor

#         break if !highest_palindrome.value.nil? && product < highest_palindrome.value

#         next unless is_palindrome?(product)

#         if highest_palindrome.value.nil? || product > highest_palindrome.value
#           highest_palindrome = PalindromeData.new(product, [[first_factor, second_factor]])
#         elsif product == highest_palindrome.value
#           highest_palindrome.factors << [first_factor, second_factor]
#         end
#       end
#     end

#     @smallest = lowest_palindrome
#     @largest = highest_palindrome
#     nil
#   end

#   private def is_palindrome?(number)
#     number_str = number.to_s
#     number_str == number_str.reverse
#   end
# end

########################################
class Palindromes
  attr_reader :max_factor, :min_factor, :smallest, :largest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    raise ArgumentError, "min must be <= max" if min_factor > max_factor
  end

  def generate    
    @smallest = find_extreme(
      iterator: :each,
      should_stop_searching: proc { |current_product, best_value| current_product > best_value },
      should_replace_best: proc { |current_product, best_value| current_product < best_value }
    )
    @largest = find_extreme(
      iterator: :reverse_each,
      should_stop_searching: proc { |current_product, best_value| current_product < best_value },
      should_replace_best: proc { |current_product, best_value| current_product > best_value }
    )
    nil
  end

  PalindromeData = Data.define(:value, :factors)

  private def find_extreme(iterator:, should_stop_searching:, should_replace_best:)
    best_palindrome = PalindromeData.new(nil, [])
    (min_factor..max_factor).public_send(iterator) do |first_factor|
      (first_factor..max_factor).public_send(iterator) do |second_factor|
        product = first_factor * second_factor

        break if !best_palindrome.value.nil? && should_stop_searching.call(product, best_palindrome.value)

        next unless is_palindrome?(product)
        
        if best_palindrome.value.nil? || should_replace_best.call(product, best_palindrome.value)
          best_palindrome = PalindromeData.new(product, [[first_factor, second_factor]])
        elsif product == best_palindrome.value
          best_palindrome.factors << [first_factor, second_factor]
        end        
      end
    end
    best_palindrome
  end

  private def is_palindrome?(number)
    number_str = number.to_s
    number_str == number_str.reverse
  end
end

palindromes = Palindromes.new(max_factor: 9)
palindromes.generate
p "max_factor: 9", palindromes.largest, palindromes.smallest

palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
palindromes.generate
p "max_factor: 99, min_factor: 10", palindromes.largest, palindromes.smallest

palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
palindromes.generate
p "max_factor: 999, min_factor: 100", palindromes.largest, palindromes.smallest

palindromes = Palindromes.new(max_factor: 9999, min_factor: 1000) # THIS ONE IS TOO SLOW!
palindromes.generate
p "max_factor: 9999, min_factor: 1000", palindromes.largest, palindromes.smallest

palindromes = Palindromes.new(max_factor: 1003, min_factor: 1002)
palindromes.generate
p "max_factor: 1003, min_factor: 1002", palindromes.largest, palindromes.smallest

palindromes = Palindromes.new(max_factor: 15, min_factor: 15)
palindromes.generate
p "max_factor: 15, min_factor: 15", palindromes.largest, palindromes.smallest

palindromes = Palindromes.new(max_factor: 4000, min_factor: 3215)
palindromes.generate
p "max_factor: 4000, min_factor: 3215", palindromes.largest, palindromes.smallest

# palindromes = p Palindromes.new(max_factor: 1, min_factor: 10_000)
# palindromes = p Palindromes.new(max_factor: 1, min_factor: 2)
