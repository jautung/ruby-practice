class Matrix
  attr_reader :values

  def initialize(matrix_str)
    rows_str = matrix_str.split("\n")
    @values = rows_str.map { |row_str| row_str.split(" ").map { |str| str.to_i } }
  end

  def row(row_idx)
    if row_idx <= 0 or row_idx > values.length
      raise
    end
    values[row_idx - 1]
  end
  
  def column(col_idx)
    if values.length <= 0
      raise
    end
    if col_idx <= 0 or col_idx > values[0].length
      raise
    end
    values.map { |row| row[col_idx - 1] } 
  end
end

m = Matrix.new("1 2\n3 4")
p m.values
p m.row(1)
p m.row(2)
p m.column(1)
p m.column(2)