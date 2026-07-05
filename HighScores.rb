class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores[-1]
  end

  def personal_best
    scores.max
  end

  def personal_top_three
    scores.sort.reverse.slice(...3)
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end

hs = HighScores.new([30, 50, 20, 70])
p hs.scores
p hs.latest
p hs.personal_best
p hs.personal_top_three