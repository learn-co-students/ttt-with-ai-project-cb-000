class Game 
  
  attr_accessor :board, :player_1, :player_2, :timer
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [8, 4, 0],
  [6, 4, 2],
  [0, 3, 6],
  [1, 4, 7],
  [8, 5, 2]
  ]
  
  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board=Board.new, wargame = false)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
   @wargame = wargame 
   @timer = 1.5
  end

def current_player
  if @board.turn_count % 2 == 0 
    return player_1
  else return player_2
end
end

def full?
  @board.none?{|space| space == " "}
end

def won?
  WIN_COMBINATIONS.detect do |c|
  board.cells[c[0]] == board.cells[c[1]] && board.cells[c[1]] == board.cells[c[2]] && (board.cells[c[0]] == "X" || board.cells[c[0]] == "O")
  end
end

def draw? 
  board.full? && !won? 
end

def over? 
  draw? || won?
end

def winner 
  if array = won?
  return @board.cells[array[1]]
  elsif !won?
  return nil
end 
end

def turn
   i = current_player.move(@board)
     if board.valid_move?(i)
       @board.update(i,current_player)
       else 
       turn
     end
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

def wargames
@counter = 0
x = 0
o = 0
draw = 0
until @counter == 100
@counter += 1
play
if draw?
draw += 1
elsif winner == "X"
x += 1
elsif winner == "O"
o += 1
end
sleep(@timer*1.5)
@timer -= (@timer/3)
end
puts "This round had #{x} wins for X, #{o} wins for O, and #{draw} draws."
puts "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO PLAY."
puts "HOW ABOUT A NICE GAME OF CHESS?"
end


end