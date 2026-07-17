# module ParallelLetterFrequency
#   def self.count(texts)
#     num_texts = texts.length

#     queue = Queue.new
#     producer_threads = texts.map { |text| Thread.new { count_single_text(text, queue) } }

#     overall_tally = Hash.new(0)
#     consumer_threads = (1..num_texts).map { |_| Thread.new { merge_into_tally(overall_tally, queue) } }

#     (producer_threads + consumer_threads).each { |thread| thread.join }

#     overall_tally
#   end

#   def self.count_single_text(text, queue)
#     tally = Hash.new(0)
#     clean_text(text).each_grapheme_cluster do |cluster|
#       tally[cluster] += 1
#     end
#     queue << tally
#   end

#   def self.clean_text(text)
#     text.downcase.scan(/\p{Letter}/).join
#   end

#   def self.merge_into_tally(overall_tally, queue)
#     single_tally = queue.pop
#     single_tally.each do |key, value|
#       overall_tally[key] += value
#     end
#   end
# end

module ParallelLetterFrequency
  RACTOR_RESULT_METHOD = Ractor.instance_methods.include?(:value) ? :value : (Ractor.instance_methods.include?(:take) ? :take : raise)

  def self.count(texts)
    ractors = texts.map do |text|
      Ractor.new(text) do |ractor_text|
        single_tally = Hash.new(0)
        ractor_text.downcase.scan(/\p{Letter}/).join.each_grapheme_cluster do |cluster|
          single_tally[cluster] += 1
        end
        single_tally
      end
    end 

    overall_tally = Hash.new(0)
    ractors.each do |ractor|
      single_tally = ractor.public_send(RACTOR_RESULT_METHOD)
      single_tally.each do |key, value|
        overall_tally[key] += value
      end
    end

    overall_tally
  end
end

p ParallelLetterFrequency.count(%w[])
p ParallelLetterFrequency.count(%w[a])
p ParallelLetterFrequency.count(%w[abbca])
p ParallelLetterFrequency.count(%w[a a])
p ParallelLetterFrequency.count(%w[abcd ac])
p ParallelLetterFrequency.count(%w[Aa aA])
p ParallelLetterFrequency.count(['  ', "\t", "\n", "\r\n"])
p ParallelLetterFrequency.count(['!', '?', ';', ',', '.', '-', '—', '’', "'", '"', '/', ':', '{}', '[]', '()'])
p ParallelLetterFrequency.count(%w[1 2 3 4 5 6 7 8 9 0])
p ParallelLetterFrequency.count(%w[本 φ ほ ø])
p ParallelLetterFrequency.count(Array.new(100, 'abc'))