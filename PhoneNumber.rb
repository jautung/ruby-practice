module PhoneNumber
  def self.clean(number)
    digits = number.chars.select { |c| /[0-9]/.match?(c) }
    if digits.length == 10
      cleaned_digits = digits.join
    elsif digits.length == 11
      if digits[0] == "1"
        cleaned_digits = digits.slice(1..).join
      else
        return nil
      end
    else
      return nil
    end
    if cleaned_digits[0] == "0" || cleaned_digits[0] == "1" || cleaned_digits[3] == "0" || cleaned_digits[3] == "1"
      return nil
    end
    cleaned_digits
  end
end

p PhoneNumber.clean('(223) 456-7890')
p PhoneNumber.clean('223.456.7890')
p PhoneNumber.clean('223 456   7890   ')
p PhoneNumber.clean('123456789')
p PhoneNumber.clean('22234567890')
p PhoneNumber.clean('12234567890')
p PhoneNumber.clean('+1 (223) 456-7890')
p PhoneNumber.clean('321234567890')
p PhoneNumber.clean('523-abc-7890')
p PhoneNumber.clean('523-@:!-7890')
p PhoneNumber.clean('(023) 456-7890')
p PhoneNumber.clean('(123) 456-7890')
p PhoneNumber.clean('(223) 056-7890')
p PhoneNumber.clean('(223) 156-7890')
p PhoneNumber.clean('1 (023) 456-7890')
p PhoneNumber.clean('1 (123) 456-7890')
p PhoneNumber.clean('1 (223) 056-7890')
p PhoneNumber.clean('1 (223) 156-7890')