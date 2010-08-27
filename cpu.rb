class CPU < Player
  attr_reader :winning_patterns, :blocking_patterns

  def initialize(piece)
    super(piece)
    create_patterns
  end

  def make_move(board)
    square = get_winning_move(board)
    square = get_blocking_move(board) if !square
    square = get_available_move(board) if !square
    return square
  end
 
  def get_winning_move(board)
    choice = nil
    match = @winning_patterns.find { |p| p.first =~ board.join() }
    choice = match.last if match
  end

  def get_blocking_move(board)
    choice = nil
    match = @blocking_patterns.find { |p| p.first =~ board.join() }
    choice = match.last if match
  end

  def get_available_move(board)
    if board[4] == 5
      choice = 5
    else
      squares = board.available_squares
      r = rand(squares.length)
      choice = squares[r]
    end
  end

  def create_patterns

    @blocking_patterns = 
    [
      [/XX3....../,3], [/X2X....../,2], [/1XX....../,1],
      [/...XX6.../,6], [/...X5X.../,5], [/...4XX.../,4],
      [/......XX9/,9], [/......X8X/,8], [/......7XX/,7],
      [/X..X..7../,7], [/X..4..X../,4], [/1..X..X../,1],
      [/.X..X..8./,8], [/.X..5..X./,5], [/.2..X..X./,2],
      [/..X..X..9/,9], [/..X..6..X/,6], [/..3..X..X/,3],
      [/X...5...X/,5], [/X...X...9/,9], [/1...X...X/,1],
      [/..X.5.X../,5], [/..X.X.7../,7], [/..3.X.X../,3]
    ]

    @winning_patterns = 
    [
      [/OO3....../,3], [/O2O....../,2], [/1OO....../,1],
      [/...OO6.../,6], [/...O5O.../,5], [/...4OO.../,4],
      [/......OO9/,9], [/......O8O/,8], [/......7OO/,7],
      [/O..O..7../,7], [/O..4..O../,4], [/1..O..O../,1],
      [/.O..O..8./,8], [/.O..5..O./,5], [/.2..O..O./,2],
      [/..O..O..9/,9], [/..O..6..O/,6], [/..3..O..O/,3],
      [/O...5...O/,5], [/O...O...9/,9], [/1...O...O/,1],
      [/..O.5.O../,5], [/..O.O.7../,7], [/..3.O.O../,3]
    ]
  end
end
