class ResistorColorTrio
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
  }.freeze

  METRIC_PREFIXES = {
    kilo: 1_000,
    mega: 1_000_000,
    giga: 1_000_000_000,
  }.freeze

  attr_reader :colors, :value

  def initialize(colors)
    raise ArgumentError if colors.length < 3
    @colors = colors
    @value = compute_value
  end

  private def compute_value
    (10 * COLOR_MAP[colors[0].to_sym] + COLOR_MAP[colors[1].to_sym]) * (10 ** COLOR_MAP[colors[2].to_sym])
  end

  private def displayed_ohms
    METRIC_PREFIXES.reverse_each do |prefix_label, prefix_value|
      if value >= prefix_value
        return "#{(value / prefix_value)} #{prefix_label.to_s}ohms"
      end
    end
    "#{value} ohms"
  end

  def label
    "Resistor value: #{displayed_ohms}"
  end
end

p ResistorColorTrio.new(%w[orange orange black]).label
p ResistorColorTrio.new(%w[blue grey brown]).label
p ResistorColorTrio.new(%w[red black red]).label
p ResistorColorTrio.new(%w[green brown orange]).label
p ResistorColorTrio.new(%w[yellow violet yellow]).label
p ResistorColorTrio.new(%w[blue violet blue]).label
p ResistorColorTrio.new(%w[black black black]).label
p ResistorColorTrio.new(%w[white white white]).label
p ResistorColorTrio.new(%w[black grey black]).label
p ResistorColorTrio.new(%w[blue green yellow orange]).label