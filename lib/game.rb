require_relative '../config/environment.rb'

class Game
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player 
    if(board.turn_count == 0)
    return player_1
  elsif(board.turn_count % 2 != 0)
    return player_2
  else
    return player_1
  end
  end
  
  def won?
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = @board.cells[win_combination[0]]
    position_2 = @board.cells[win_combination[1]]
    position_3 = @board.cells[win_combination[2]]
    if(position_1 == "X" && position_2 == "X" && position_3 == "X")
      return win_combination
    end
    if(position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  return false
  end
  
  def draw?
  if(!won? && board.full?)
    return true
  else
    return false
  end
  end
  
  def over?
  if(won? || board.full? || draw?)
    return true
  else
    return false
end
end

def winner
  if(won?)
    if(@board.cells[won?[0]] == "X")
      return "X"
    else
      return "O"
    end
  end
end

def turn
  player = current_player
  input = player.move(@board)
  
  until @board.valid_move?(input) do
    input = player.move(@board)
    break
  end
  board.update(input, player)
  board.display

end

def play
  until over? do
  turn
  end
  if(won?)
    puts "Congratulations #{winner}!"
  elsif(draw?)
    puts "Cat's Game!"
  end
end
  
  


  
  
end