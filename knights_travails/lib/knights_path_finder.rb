require_relative "00_tree_node"
require "byebug"

class KnightPathFinder

  KNIGHT_MOVES_DELTA = [
    [2,1],
    [2, -1],
    [-2,1],
    [-2,-1],
    [-1,2],
    [-1,-2],
    [1,2],
    [1,-2]
  ]

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @start_pos = start_pos
    @pos = start_pos
    @move_tree = #???
    @visited_positions = []
  end

  def build_move_tree

  end

  def self.valid_moves(pos, visited_positions)
    current_row, current_col = pos
    potential_moves = []
    byebug
    KNIGHT_MOVES_DELTA.each do |delta|
      row_delta, col_delta = delta
      new_row = current_row + row_delta
      new_col = current_col + col_delta
      if (new_row).between?(0, 7) &&
         (new_col).between?(0, 7) &&
         !visited_positions.include?([new_row, new_col])
         potential_moves << [new_row, new_col]
      end
    end
    potential_moves
  end
end
