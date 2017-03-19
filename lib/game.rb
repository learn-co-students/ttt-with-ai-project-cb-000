class Game

  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,3,6], #first col win
    [1,4,7], #second col win
    [2,5,8], #third col win
    [0,4,8], #diagonal win
    [2,4,6] #diagonal win
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def draw?
    !self.won? && @board.full?
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
    binding.pry

  end
  def over?
    @board.full? || self.won?
  end

  def winner

  end


end
