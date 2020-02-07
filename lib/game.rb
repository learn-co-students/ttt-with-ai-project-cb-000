
class Game
  attr_accessor :board, :player_1, :player_2
  include Players

  WIN_COMBINATIONS = [
    [0, 1, 2], #top horiz
    [3, 4, 5], #middle horiz
    [6, 7, 8], #bottom horiz
    [0, 3, 6], #left vert
    [1, 4, 7], #middle vert
    [2, 5, 8], #right vert
    [0, 4, 8], #l-r diag
    [2, 4, 6] #r-l diag
  ]

  def initialize (player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? != false || @board.full?
  end

  def won?
    winCombo = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|place| @board.cells[place]=="X"} || combo.all? {|place| @board.cells[place]=="O"}
        winCombo = combo
        break
      end
    end
    winCombo
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    current_player.token == "X" ? "O" : "X" if won? != false #if game  won, current_player can't move bcause player before is winner
  end

  def turn
    placement = current_player.move(@board)
    if @board.valid_move?(placement)
      @board.update(placement, current_player)
      placement
    else
      "invalid"
      turn
    end
  end

  def play
    if !over?
      turn
      play if !draw?
    else
      draw? ? puts("Cat's Game!") : puts("Congratulations #{winner}!")
    end
  end

end
