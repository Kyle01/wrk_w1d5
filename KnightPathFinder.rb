require_relative "00_tree_node.rb"
class KnightPathFinder
  attr_reader :board, :pos, :move_tree, :visited_positions
  
  def self.valid_moves(pos)
    valid_moves = []
    x, y = pos
    valid_moves << [x+2,y+1] if self.on_board?([x+2, y+1])
    valid_moves << [x+2,y-1] if self.on_board?([x+2, y-1])
    valid_moves << [x-2,y+1] if self.on_board?([x-2, y+1])
    valid_moves << [x-2,y-1] if self.on_board?([x-2, y-1])
    valid_moves << [x+1,y+2] if self.on_board?([x+1, y+2])
    valid_moves << [x-1,y+2] if self.on_board?([x-1, y+2])
    valid_moves << [x-1,y-2] if self.on_board?([x-1, y-2])
    valid_moves << [x+1,y-2] if self.on_board?([x+1, y-2])
    valid_moves
  end   
  
  def self.on_board?(pos)
    x, y = pos 
    return true if x.between?(0, 7) && y.between?(0,7) 
    false
  end
  
  def initialize(board = Array.new(8){Array.new(8)}, pos)
    @board = board
    @pos = pos
    @visited_positions = [pos]
    @move_tree = build_move_tree
  end 
  
  def new_move_positions(pos)
    valid_moves = self.class.valid_moves(pos)
    valid_moves = valid_moves.select { |el| el if !@visited_positions.include?(el) }
  end 
  
  def find_path(path)
    
  end 
  
  def build_move_tree
    root = PolyTreeNode.new(pos)
    new_moves = new_move_positions(pos)
    until new_moves.empty?
      new_moves.each do |el|
        root.add_child(el) 
        visited_positions << new_moves_positions.shift
      end 
      new_moves = new_move_positions(new_moves.first)
    end 
  end 
  

end 