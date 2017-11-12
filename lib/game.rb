require "pry"

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
  def initialize(player1=Players::Human.new("X"),player2=Players::Human.new("O"),board=Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  def draw?
    @board.full? && !won?
  end
  def over?
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0])
    end
  end

  def winner
    if winning_combination = won?
      @board.cells[winning_combination.first]
      #binding.pry
    end
  end

  def turn
    player = current_player
    input = player.move(@board)
    if validate_input?(input)
      @board.update(input,player)
    else
       turn
     end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end


  def validate_input?(index)
    index = index.to_i
    if index.is_a? Integer
      index.between?(1,9)
    else
      false
    end
  end
end
