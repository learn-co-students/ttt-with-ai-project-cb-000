require "pry"

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
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
    WIN_COMBINATIONS.detect {|combo| combo.all? {|indx| @board.cells[indx] == "X"} || combo.all? {|indx| @board.cells[indx] == "O"} }
  end

  def winner
    @board.cells[won?.first] if won?
  end

  def turn
    input = current_player.move(@board)
    @board.valid_move?(input) ? @board.update(input,current_player) : turn
  end

  def play
    while !over? do turn end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

end
