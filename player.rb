class Player

  attr_accessor :piece
  def initialize(piece)
    @piece = piece
  end
  
  def make_move(board)
    print "Player #{piece} choose your move (1-9): "
    gets.chomp
  end
  
  def to_s
    @piece
  end
  
end
