require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.cells.all? { |cell| cell == " " } || board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    @xs = []
    @os = []
    board.cells.each_with_index do |cell, index|
      if cell == "X"
        @xs << index
      elsif cell == "O"
        @os << index
      end
    end

    WIN_COMBINATIONS.detect do |combination|
      combination.all? { |cell| @xs.include? cell } || combination.all? { |cell| @os.include? cell }
    end
  end

  def draw?
    true if !won? && board.full?
  end

  def over?
    true if draw? || won?
  end

  def winner
    winner = ""
    if won?
      WIN_COMBINATIONS.each do |combination|
        if combination.all? { |cell| @xs.include? cell }
          winner = "X"
        elsif combination.all? { |cell| @os.include? cell }
          winner = "O"
        end
      end
      winner
    else
      nil
    end
  end

  def turn
    puts "Where would you like to go?:"
    input = current_player.move(input).to_i
    board.valid_move?(input) ? board.update(input, current_player) : turn
    board.display
    self.current_player
  end

  def play
    until self.over? do
      self.turn
    end
    puts "Congratulations X!" if winner == "X"
    puts "Congratulations O!" if winner == "O"
    puts "Cat's Game!" if draw?
  end

end
