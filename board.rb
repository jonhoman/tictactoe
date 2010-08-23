class Board
  attr_reader :board
  
  def initialize()
    @winning_patterns = 
    [
      /XXX....../,
      /...XXX.../,
      /......XXX/,
      /X...X...X/,
      /..X.X.X../,
      /X..X..X../,
      /.X..X..X./,
      /..X..X..X/,
      /OOO....../,
      /...OOO.../,
      /......OOO/,
      /O...O...O/,
      /..O.O.O../,
      /O..O..O../,
      /.O..O..O./,
      /..O..O..O/
    ]
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def [](index)
    return @board[index]
  end

  def []=(index, choice)
    @board[index] = choice
  end

  def print_board
    msg = @board[0..2].join(" | ") + "\n" + 
          @board[3..5].join(" | ") + "\n" + 
          @board[6..8].join(" | ") + "\n"
    puts msg
  end

  def valid_move?(choice)
    @board.include?(choice.to_i)
  end

  def check_for_win(player)
    game_won = false
    @winning_patterns.each do |p|
      if @board.join().match(p) 
        puts "Player #{player}, you've won."
        game_won = true
      end
    end
    game_won
  end

  def clear_board
    clear_code = %x{clear}
    print clear_code
  end

end
