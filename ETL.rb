module ETL
  def self.transform(old_hash)
    new_hash = {}
    old_hash.each do |value, letters|
      letters.each do |letter|
        new_hash[letter.downcase] = value
      end
    end
    new_hash
  end
end

p ETL.transform({ 1 => ["A"] })
p ETL.transform({ 1 => %w[A E I O U] })
p ETL.transform({
  1 => %w[A E I O U L N R S T],
  2 => %w[D G],
  3 => %w[B C M P],
  4 => %w[F H V W Y],
  5 => ["K"],
  8 => %w[J X],
  10 => %w[Q Z]
})