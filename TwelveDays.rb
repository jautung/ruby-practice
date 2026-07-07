module TwelveDays
  ORDINALS = [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
  ]

  GIFTS = [
    "twelve Drummers Drumming",
    "eleven Pipers Piping",
    "ten Lords-a-Leaping",
    "nine Ladies Dancing",
    "eight Maids-a-Milking",
    "seven Swans-a-Swimming",
    "six Geese-a-Laying",
    "five Gold Rings",
    "four Calling Birds",
    "three French Hens",
    "two Turtle Doves",
    "a Partridge in a Pear Tree",
  ]

  def self.song
    sentences = (0..11).map do |idx| 
      sentence_prefix = "On the #{ORDINALS[idx]} day of Christmas my true love gave to me"
      sentence_suffix = ""
      (0..idx).each do |inner_idx|
        new_gift = GIFTS[-(inner_idx+1)]
        if inner_idx == 0
          sentence_suffix = new_gift
        elsif inner_idx == 1
          sentence_suffix = "#{new_gift}, and #{sentence_suffix}"
        else
          sentence_suffix = "#{new_gift}, #{sentence_suffix}"
        end
      end
      "#{sentence_prefix}: #{sentence_suffix}."
    end
    sentences.join("\n\n") + "\n"
  end
end

p TwelveDays.song