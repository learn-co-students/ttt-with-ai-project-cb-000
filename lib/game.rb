class Game

attr_accessor :player_1, :player_2, :board


 WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


def initialize(player_1=("X"),player_2=("O"),board=Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def player_1
  @player_1
end

def turn_count
  counter = 0
  self.board.cells.each do |play|
    if play == self.player_1.token.to_s || play == self.player_2.token.to_s
      counter += 1
    end
  end
  return  counter
end

def current_player
  count = turn_count
  if count%2 ==0 || count == 0
    return self.player_1.token
  else
    return self.player_2.token
  end
end

def won?


  WIN_COMBINATIONS.each do |win_combination|

    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1= self.board.cells[win_index_1]
    position_2= self.board.cells[win_index_2]
    position_3= self.board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end


  end

  if self.board.cells.empty?
    return false
  end




end

def draw?
  self.board.full?
  set = self.won?
    if set.nil?
      return true
    end
  if set== WIN_COMBINATIONS[0]
    return false
  end



end

def over?
  set = self.won?
  if set.nil? && self.board.full?
    return true
  end
  self.draw?
  self.won?
end

def play

   until over?
       turn
   end




  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
   puts "Cat's Game!"
  end


 end

 def move(board, index, character)
    board[index] = character
  end

  def winner

    set = self.won?
    if set.nil?
      return nil
    end
    win_set =self.board.cells[set[0]]
    if win_set == "O"
      return "O"
    end
    if win_set == "X"
      return "X"
    else
      return nil
    end



  end

#  def move(index, character)
#  self.board.cells[index] = character
#end



#def turn
# puts "Please choose a number 1-9:"
#  user_input = gets
#  state = self.board.full? || self.over?
#  while state=== false
#    index = self.board.input_to_index(user_input)
#    if self.board.valid_move?(index)
#    player_token = current_player.token
#    move(index, player_token)
#    self.board.display
#  else
#    turn
#      break if state===true
#    end
#  end

#end



def turn
 puts "Please choose a number 1-9:"
  user_input = gets
  index = self.board.input_to_index(user_input)
  until self.over? === true
  if self.board.valid_move?(index)
    player_token = current_player.token
    move(index, player_token)
    self.board.display
  else
    turn
    if self.board.full? || self.game.won?
      break
    end
  end
  end

end


end
