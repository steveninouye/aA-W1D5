require_relative "00_tree_node"

class KnightPathFinder
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
