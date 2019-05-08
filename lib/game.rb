class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [2,5,8], # Third column --> moved to make #won combination test pass
   [3,4,5], # Middle row
   [6,7,8], # Bottom row
   [0,3,6], # First column
   [1,4,7], # Second column
   [0,4,8], # Left diagonal
   [2,4,6]  # Right diagonal
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    @board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.cells[combo[0]] != ' '
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    nil if !won?
    win_combo = won?
    if win_combo
      win_combo = @board.cells[win_combo[0]]
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    @board.display
    while !over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
