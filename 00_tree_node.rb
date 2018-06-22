class PolyTreeNode
  
  attr_reader :parent, :children, :value
  def initialize(value, parent = nil, children = [] )
    @value = value
    @parent = parent
    @children = children
  end 
  
  def parent=(parent_node) 
     @parent.children.delete(self) unless @parent.nil?
     parent_node.nil? ? @parent = nil : @parent = parent_node
     parent_node.children << self unless parent_node.nil?
  end 
  
  def add_child(child)
    child.parent = self
  
  end 

  
  def remove_child(child)
    raise "node is not a child" if child.parent.nil?
    child.parent = nil
  end 
  
  def dfs(target) 
    return self if target == @value
    children.each do |child|
      child_node = child.dfs(target)
      return child_node unless child_node.nil?
    end
    nil
  end 
  
  def bfs(target)
    queue = []
    queue << self
    until queue.empty?
      node = queue.shift
      return node if node.value == target
      queue << node.children
      queue.flatten!
    end 
    nil
  end 
  
end