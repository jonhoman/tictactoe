require 'board'
@board = Board.new
@game_won = false

@board.print
move_count = 0

while (!@game_won) do  
  player = move_count % 2 == 0 ? "X" : "O"
  print "Player #{player} choose your move (1-9): "
  choice = gets.chomp
  
  if @board.valid_move?(choice)
    puts "Player #{player} chose #{choice}\n"

    @board[choice.to_i - 1] = player
    #@board.clear
    @board.print
    move_count += 1
  else
    puts "Player #{player}, your choice was invalid. Please select again." 
  end
  @game_won = @board.check_for_win(player)
end
