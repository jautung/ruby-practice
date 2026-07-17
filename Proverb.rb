class Proverb
  attr_reader :chain, :qualifier

  def initialize(*chain, qualifier: nil)
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    return "" unless chain.length > 0

    lines = []
    chain.each.with_index do |item, index|
      break if index == chain.length - 1

      lines << "For want of a #{chain[index]} the #{chain[index + 1]} was lost."
    end
    lines << "And all for the want of a #{qualifier ? "#{qualifier} " : ""}#{chain[0]}."

    lines.join("\n")
  end
end

puts Proverb.new(*%w[]).to_s
puts Proverb.new(*%w[nail]).to_s
puts Proverb.new(*%w[nail shoe horse rider message battle kingdom]).to_s
puts Proverb.new(*%w[nail shoe horse rider message battle kingdom], qualifier: 'horseshoe').to_s