require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,4,8],
                      [2,4,6],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8]]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    win = WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|position| @board.cells[position] == "X"} || win_combination.all? {|position| @board.cells[position] == "O"}
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    move = current_player.move(@board)
    turn if !@board.valid_move?(move)
    @board.update(move, current_player)
  end

  def play
    turn while !over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end
