module Transpose
  def self.transpose(str)
    if str.empty?
      return ""
    end
    lines = str.split("\n")
    max_length = lines.map { |l| l.length }.max
    transposed_rows = []
    (0...max_length).each do |index|
      row = lines.map { |l| l.length > index ? l[index] : nil }
      row.pop while row.last.nil? && !row.empty?
      transposed_rows << row.map { |i| i.nil? ? " " : i }
    end
    transposed_rows.map { |r| r.join("") }.join("\n")
  end
end

puts Transpose.transpose("ABC\nDEF")
puts Transpose.transpose("ABC\nDE")
puts Transpose.transpose("AB\nDEF")
puts Transpose.transpose("ABC\n123")

puts Transpose.transpose("")
puts Transpose.transpose("A1")
puts Transpose.transpose("A\n1")
puts Transpose.transpose("ABC\n123")
puts Transpose.transpose("Single line.")
puts Transpose.transpose("The fourth line.\nThe fifth line.")
puts Transpose.transpose("The first line.\nThe second line.")
puts Transpose.transpose("The longest line.\nA long line.\nA longer line.\nA line.")
puts Transpose.transpose("HEART\nEMBER\nABUSE\nRESIN\nTREND")
puts Transpose.transpose("FRACTURE\nOUTLINED\nBLOOMING\nSEPTETTE")
puts Transpose.transpose("T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR")
puts Transpose.transpose("11\n2\n3333\n444\n555555\n66666")