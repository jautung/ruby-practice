module Luhn
  def self.valid?(num_str)
    num_str_without_spaces = num_str.chars.select { |c| c != " " }.join
    unless num_str_without_spaces.length > 1
      return false
    end
    unless num_str_without_spaces.match?(/\A\d*\z/)
      return false
    end
    digits = num_str_without_spaces.chars.map { |c| c.to_i }
    doubled_digits = digits.map.with_index do |digit, index|
      should_double = (digits.length - index) % 2 == 0
      if should_double
        if 2 * digit > 9
          2 * digit - 9
        else
          2 * digit
        end
      else
        digit
      end
    end
    doubled_digits.sum % 10 == 0
  end
end

p '4539 3195 0343 6467', Luhn.valid?('4539 3195 0343 6467')
p '066 123 478', Luhn.valid?('066 123 478')
p '1', Luhn.valid?('1')
p '0', Luhn.valid?('0')
p '059', Luhn.valid?('059')
p '59', Luhn.valid?('59')
p '055 444 285', Luhn.valid?('055 444 285')
p '055 444 286', Luhn.valid?('055 444 286')
p '8273 1232 7352 0569', Luhn.valid?('8273 1232 7352 0569')
p '1 2345 6789 1234 5678 9012', Luhn.valid?('1 2345 6789 1234 5678 9012')
p '1 2345 6789 1234 5678 9013', Luhn.valid?('1 2345 6789 1234 5678 9013')