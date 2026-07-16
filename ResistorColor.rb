class ResistorColor
  COLOR_MAP = {
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

  COLORS = COLOR_MAP.keys.map { |k| k.to_s }

  def self.color_code(color)
    COLOR_MAP[color.to_sym]
  end
end

p ResistorColor::COLORS
p ResistorColor.color_code('orange')
p ResistorColor.color_code('white')