# class SpaceAge
#   SECONDS_IN_EARTH_YEAR = 31_557_600.to_f
#   MERCURY_PERIOD_EARTH_YEARS = 0.2408467.to_f
#   VENUS_PERIOD_EARTH_YEARS = 0.61519726.to_f
#   EARTH_PERIOD_EARTH_YEARS = 1.0.to_f
#   MARS_PERIOD_EARTH_YEARS = 1.8808158.to_f
#   JUPITER_PERIOD_EARTH_YEARS = 11.862615.to_f
#   SATURN_PERIOD_EARTH_YEARS = 29.447498.to_f
#   URANUS_PERIOD_EARTH_YEARS = 84.016846.to_f
#   NEPTUNE_PERIOD_EARTH_YEARS = 164.79132.to_f

#   attr_reader :seconds

#   def initialize(seconds)
#     @seconds = seconds
#   end

#   def on_earth
#     seconds / SECONDS_IN_EARTH_YEAR / EARTH_PERIOD_EARTH_YEARS
#   end

#   def on_mercury
#     seconds / SECONDS_IN_EARTH_YEAR / MERCURY_PERIOD_EARTH_YEARS
#   end

#   def on_venus
#     seconds / SECONDS_IN_EARTH_YEAR / VENUS_PERIOD_EARTH_YEARS
#   end

#   def on_mars
#     seconds / SECONDS_IN_EARTH_YEAR / MARS_PERIOD_EARTH_YEARS
#   end

#   def on_jupiter
#     seconds / SECONDS_IN_EARTH_YEAR / JUPITER_PERIOD_EARTH_YEARS
#   end

#   def on_saturn
#     seconds / SECONDS_IN_EARTH_YEAR / SATURN_PERIOD_EARTH_YEARS
#   end

#   def on_uranus
#     seconds / SECONDS_IN_EARTH_YEAR / URANUS_PERIOD_EARTH_YEARS
#   end

#   def on_neptune
#     seconds / SECONDS_IN_EARTH_YEAR / NEPTUNE_PERIOD_EARTH_YEARS
#   end
# end

class SpaceAge
  SECONDS_IN_EARTH_YEAR = 31_557_600.to_f

  PLANET_PERIODS_EARTH_YEARS = {
    mercury: 0.2408467.to_f,
    venus: 0.61519726.to_f,
    earth: 1.0.to_f,
    mars: 1.8808158.to_f,
    jupiter: 11.862615.to_f,
    saturn: 29.447498.to_f,
    uranus: 84.016846.to_f,
    neptune: 164.79132.to_f,
  }

  def initialize(seconds)
    @seconds = seconds
  end

  PLANET_PERIODS_EARTH_YEARS.map do |planet, period|
    define_method("on_#{planet}".to_sym) {
      @seconds / SECONDS_IN_EARTH_YEAR / period
    }
  end
end

p SpaceAge.new(1_000_000_000).on_earth
p SpaceAge.new(2_134_835_688).on_mercury
p SpaceAge.new(189_839_836).on_venus
p SpaceAge.new(2_129_871_239).on_mars
p SpaceAge.new(901_876_382).on_jupiter
p SpaceAge.new(2_000_000_000).on_saturn
p SpaceAge.new(1_210_123_456).on_uranus
p SpaceAge.new(1_821_023_456).on_neptune