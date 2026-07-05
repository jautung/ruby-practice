module ResistorColorDuo
  COLOR_TO_VALUE = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  }

  def self.value(colors)
    if colors.length < 2
      raise
    end
    10 * color_value(colors[0]) + color_value(colors[1])
  end

  def self.color_value(color)
    raw_value = COLOR_TO_VALUE[color.to_sym]
    raw_value == nil ? raise : raw_value
  end
end

p ResistorColorDuo.value(%w[brown black])
p ResistorColorDuo.value(%w[green brown orange])
