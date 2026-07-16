class SpiralMatrix
  attr_reader :len

  def initialize(len)
    @len = len
  end

  module Direction
    RIGHT = 0
    DOWN = 1
    LEFT = 2
    UP = 3
  end

  DIRECTION_MAP = {
    Direction::RIGHT => { row: 0, col: 1 },
    Direction::DOWN => { row: 1, col: 0 },
    Direction::LEFT => { row: 0, col: -1 },
    Direction::UP => { row: -1, col: 0 },
  }

  def matrix
    matrix = Array.new(len) { |_| Array.new(len) }
    position = { row: 0, col: 0 }
    direction = Direction::RIGHT
    filled = 0
    while filled < len ** 2
      matrix[position[:row]][position[:col]] = filled + 1
      maybe_next_position = SpiralMatrix.add_position(position, direction)
      if valid_position(maybe_next_position) and matrix[maybe_next_position[:row]][maybe_next_position[:col]] == nil
        position = maybe_next_position
      else
        direction = (direction + 1) % 4
        position = SpiralMatrix.add_position(position, direction)
      end
      filled += 1
    end
    matrix
  end

  def valid_position(position)
    valid_coord(position[:row]) and valid_coord(position[:col])
  end

  def valid_coord(coord)
    coord >= 0 and coord < len
  end

  def self.add_position(position, direction)
    direction_vals = DIRECTION_MAP[direction]
    { row: position[:row] + direction_vals[:row], col: position[:col] + direction_vals[:col] }
  end
end

p SpiralMatrix.new(1).matrix
p SpiralMatrix.new(2).matrix
p SpiralMatrix.new(3).matrix
p SpiralMatrix.new(4).matrix