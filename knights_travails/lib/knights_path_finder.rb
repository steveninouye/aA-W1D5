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
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    moves = self.class.valid_moves(pos)
    filtered_moves = moves.reject { |move| @visited_positions.include?(move)}
    @visited_positions.concat(filtered_moves)
    filtered_moves
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      current_node = queue.shift
      new_moves = new_move_positions(current_node.value)
      new_moves.each do |move|
        node = PolyTreeNode.new(move)
        node.parent = current_node
        queue << node
      end
    end
  end

  def self.valid_moves(pos)
    current_row, current_col = pos
    potential_moves = []
    KNIGHT_MOVES_DELTA.each do |delta|
      row_delta, col_delta = delta
      new_row = current_row + row_delta
      new_col = current_col + col_delta
      if (new_row).between?(0, 7) &&
         (new_col).between?(0, 7)
         potential_moves << [new_row, new_col]
      end
    end
    potential_moves
  end
end
