class CPU < Player

  def make_move(board)
    squares = board.available_squares
    r = rand(squares.length)
    squares[r]
  end

end
