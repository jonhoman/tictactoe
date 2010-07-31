board = [1, 2, 3, 4, 5, 6, 7, 8, 9]


def print_board(board)
  msg = board[0..2].join(" | ") + "\n" + 
        board[3..5].join(" | ") + "\n" + 
        board[6..8].join(" | ") + "\n"
  puts msg
end

print_board(board)
move_count = 0

while (true) do  
  player = move_count % 2 == 0 ? "X" : "O"
  print "Player #{player} choose your move (1-9): "
  choice = gets.chomp

  puts "Player #{player} chose #{choice}\n"
  
  board[choice.to_i - 1] = player
  print_board(board)
  move_count += 1
end