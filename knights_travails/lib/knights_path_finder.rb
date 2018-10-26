require_relative "00_tree_node"

class KnightPathFinder

  KNIGHT_MOVES = [
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

  def self.valid_moves(pos)

  end
end
