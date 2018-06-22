require_relative "00_tree_node.rb"
class KnightPathFinder
  attr_reader :board, :pos, :move_tree, :visited_positions
  
  def self.valid_moves(pos)
    
  end   
  
  
  def initialize(board = Array.new(8){Array.new(8)}, pos)
    @board = board
    @pos = pos
    @visited_positions = [pos]
    @move_tree = build_move_tree
  end 
  
  def find_path(path)
    
  end 
  
  def build_move_tree
    
  end 
  
  private
  
  def in_range?(pos)
    x, y = pos 
    return false if x < 0 
  end
  
end 