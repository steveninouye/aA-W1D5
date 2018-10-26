require_relative "00_tree_node"

class KnightPathFinder
  def initialize(start_pos)
    @start_node = PolyTreeNode.new(start_pos)
    @start_pos = start_pos
    @pos = start_pos
    @move_tree = #???
  end

  def build_move_tree

  end
end
