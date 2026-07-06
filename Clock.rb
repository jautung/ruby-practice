class Clock
  MINUTES_PER_HOUR = 60
  HOUR_PER_DAY = 24

  attr_reader :total_minutes

  def initialize(hour: 0, minute: 0)
    @total_minutes = (MINUTES_PER_HOUR * hour + minute) % (HOUR_PER_DAY * MINUTES_PER_HOUR)
  end

  def to_s
    hours = (total_minutes / MINUTES_PER_HOUR).floor
    minutes = total_minutes % MINUTES_PER_HOUR
    ["%02d" % hours, "%02d" % minutes].join(":")
  end

  def +(other_clock)
    Clock.new(minute: total_minutes + other_clock.total_minutes)
  end

  def -(other_clock)
    Clock.new(minute: total_minutes - other_clock.total_minutes)
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end
end

p Clock.new(hour: 8).to_s
p Clock.new(hour: 1, minute: 60).to_s
p Clock.new(minute: 1723).to_s
p (Clock.new(hour: 10) + Clock.new(minute: 3)).to_s
p (Clock.new(hour: 10, minute: 3) - Clock.new(minute: 70)).to_s
p (Clock.new(minute: 3) - Clock.new(minute: 4)).to_s
p (Clock.new(hour: 15, minute: 37) == Clock.new(hour: 15, minute: 37))