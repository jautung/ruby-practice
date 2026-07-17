module Bob
  def self.hey(remark)
    is_question = /\?\s*\z/.match?(remark)
    has_letters = /[a-zA-Z]/.match?(remark)
    is_all_caps = has_letters && remark == remark.upcase
    is_whitespace = /\A\s*\z/.match?(remark)
    if is_whitespace
      "Fine. Be that way!"
    elsif is_question && is_all_caps
      "Calm down, I know what I'm doing!"
    elsif is_question
      "Sure."
    elsif is_all_caps
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end
end