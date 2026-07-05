class Series
  attr_reader :str

  def initialize(str)
    if str.length <= 0
      raise ArgumentError
    end
    @str = str
  end

  def slices(num)
    if num <= 0 or num > str.length
      raise ArgumentError
    end
    (0..(str.length - num)).map { |start_idx| str.slice(start_idx...(start_idx+num))}
  end
end

p Series.new('9142').slices(2)
p Series.new('777777').slices(3)