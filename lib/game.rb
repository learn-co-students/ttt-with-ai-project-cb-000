class Game

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

attr_accessor :board, :player_1, :player_2

def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
  @player_1=player1
  @player_2=player2
  @board=board
end

def current_player
  board.turn_count % 2 == 0 ? player_1 : player_2
end

def over?
  won? || draw?
end

def won?
  WIN_COMBINATIONS.each do |wincombo|

    if board.cells[wincombo[0]] == "X" && board.cells[wincombo[1]] == "X" && board.cells[wincombo[2]] == "X"
      return wincombo
    elsif board.cells[wincombo[0]] == "O" && board.cells[wincombo[1]] == "O" && board.cells[wincombo[2]] == "O"
      return wincombo
    end
  end
  return false
end

def draw?
  if board.full? && won? == false
    return true
  end
end

def winner
  WIN_COMBINATIONS.each do |wincombo|
    if board.cells[wincombo[0]] == "X" && board.cells[wincombo[1]] == "X" && board.cells[wincombo[2]] == "X"
      return "X"
    elsif board.cells[wincombo[0]] == "O" && board.cells[wincombo[1]] == "O" && board.cells[wincombo[2]] == "O"
      return "O"
  end
  end
  return nil
end

def turn
  puts "It is currently #{current_player.token}'s turn:"
  movement = current_player.move(board)
  if board.valid_move?(movement)
    board.update(movement, current_player)
    board.display
    movement
  else
    turn
  end
end

def play
  while !over?
    turn
    end
  if draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
    end
  end
end
