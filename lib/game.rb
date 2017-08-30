class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

  def initialize(player1 = Players::Human.new('X'), player2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |c|
      @board.cells[c[0]] == @board.cells[c[1]] &&
        @board.cells[c[1]] == @board.cells[c[2]]
    end
  end

  def draw?
    return true if @board.full? && !won?
  end

  def winner
    winning_index = won?[0]
    # binding.pry
    if @player_1.token == @board.cells[winning_index]
      player_1.token
    elsif @player_2.token == @board.cells[winning_index]
      player_2.token
    else
      nil
    end
  end

  def turn

  end

  def play

  end

end