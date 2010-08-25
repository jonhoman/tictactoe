require 'board'
require 'player'
require 'cpu'

@board = Board.new
@player_x = Player.new("X")
@player_o = CPU.new("O")

@game_won = false
@full_board = false

@board.print
move_count = 0

while (!@game_won && !@full_board) do  
  player = move_count % 2 == 0 ? @player_x : @player_o
  choice = player.make_move(@board)
  
  if @board.valid_move?(choice)
    puts "Player #{player} chose #{choice}\n"

    @board[choice.to_i - 1] = player.piece
    #@board.clear
    @board.print
    move_count += 1
  else
    puts "Player #{player}, your choice was invalid. Please select again." 
  end
  @game_won = @board.check_for_win(player)
  @full_board = @board.full?
end
