class Queens
  attr_reader :white
  attr_reader :black

  def initialize(white: nil, black: nil)
    if white
      Queens.validate_position(white)
    end
    if black
      Queens.validate_position(black)
    end
    @white = white
    @black = black
  end

  def attack?
    if not white or not black
      raise ArgumentError
    end
    Queens.same_row(white, black) or Queens.same_col(white, black) or Queens.same_diag(white, black)
  end

  def self.validate_position(pos)
    if pos.length != 2
      raise ArgumentError
    end
    Queens.validate_coord(pos[0])
    Queens.validate_coord(pos[1])
  end

  def self.validate_coord(coord)
    if coord < 0 or coord >= 8
      raise ArgumentError
    end
  end

  def self.same_row(coord1, coord2)
    coord1[1] == coord2[1]
  end

  def self.same_col(coord1, coord2)
    coord1[0] == coord2[0]
  end

  def self.same_diag(coord1, coord2)
    col_dist = (coord1[0] - coord2[0]).abs
    row_dist = (coord1[1] - coord2[1]).abs
    col_dist == row_dist
  end
end