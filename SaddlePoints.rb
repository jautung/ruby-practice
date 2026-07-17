module Grid
  def self.saddle_points(grid)
    return [] if grid.length == 0
    return [] if grid[0].length == 0

    num_rows = grid.length
    num_cols = grid[0].length

    raise ArgumentError if grid.any? { |row| row.length != num_cols }

    result = []
    (0...num_rows).each do |row_index|
      (0...num_cols).each do |col_index|
        result << { "row" => row_index + 1, "column" => col_index + 1 } if saddle_point?(row_index, col_index, grid)
      end
    end

    result
  end

  def self.saddle_point?(row_index, col_index, grid)
    curr_value = grid[row_index][col_index]
    is_tallest_in_row = grid[row_index].max == curr_value
    is_shortest_in_col = grid.map { |row| row[col_index] }.min == curr_value
    is_tallest_in_row && is_shortest_in_col
  end
end

p Grid.saddle_points([[9, 8, 7], [5, 3, 2], [6, 6, 7]])
p Grid.saddle_points([[4, 5, 4], [3, 5, 5], [1, 5, 4]])