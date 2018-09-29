#require 'pry'
class Game

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find{|comb| comb.all?{|pos| @board.cells[pos] == "X"} || comb.all?{|pos| @board.cells[pos] == "O"}}
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    move = ""
    loop do
      move = current_player.move(@board)
      break if @board.valid_move?(move)
    end
    @board.update(move, current_player)
    @board.display
  end

  def play
    #loop do
      turn
      #break if over?
    #end
    #won? ? puts "Congratulations #{self.winner}!" : puts "Cat's Game!"
  end

end
