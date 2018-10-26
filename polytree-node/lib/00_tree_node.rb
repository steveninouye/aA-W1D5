require "byebug"

class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    return if node == @parent
    @parent.children.delete(self) if @parent
    @parent = node
    @parent.add_child(self) if node
  end

  def add_child(child_node)
    # debugger
    unless @children.include?(child_node)
      @children << child_node
      child_node.parent = self
    end
  end

  def remove_child(child_node)
    raise "Can't remove node because not child node" unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_val)
    return self if @value == target_val
    @children.each do |child|
      # return child if child.value == target_val
      result = child.dfs(target_val)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue = queue + current_node.children
    end
    nil
  end

  def inspect
    "id: #{self.object_id.to_s[-3..-1]}, value: #{@value}. children: #{@children}, parent: #{parent}"
  end
end
