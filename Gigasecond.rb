require 'time'

module Gigasecond
  def self.from(init_time)
    init_time + 1_000_000_000
  end
end

p Gigasecond.from(Time.parse('2011-04-25T00:00:00 UTC'))