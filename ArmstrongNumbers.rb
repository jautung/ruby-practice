module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    num_digits = digits.length
    digits.map { |d| d ** num_digits }.sum == number
  end
end