class Sieve
  attr_reader :end_num

  def initialize(end_num)
    raise if end_num < 1
    @end_num = end_num
  end

  def primes
    main_arr = (2..end_num).to_a
    (0...main_arr.length).each do |curr_index|
      curr_val = main_arr[curr_index]
      next if curr_val.nil?
      (2..((end_num / curr_val).floor)).each { |mult| main_arr[curr_val * mult - 2] = nil }
    end
    main_arr.select { |val| !val.nil? }
  end
end

p Sieve.new(1).primes
p Sieve.new(2).primes
p Sieve.new(13).primes