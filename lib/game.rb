class Game
  # Game #board provides access to the board
  # Game #player_1 provides access to player_1
  # Game #player_2 provides access to player_2
  attr_accessor :board, :player_1, :player_2


  # Game ::WIN_COMBINATIONS defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # Game initialize accepts 2 players and a board
  # Game initialize defaults to two human players, X and O, with an empty board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  # Game #current_player returns the correct player, X, for the third move
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  # Game #over? returns true for a draw
  # Game #over? returns true for a won game
  # Game #over? returns false for an in-progress game
  def over?
    won? || draw?
  end

  # Game #won? returns false for a draw
  # Game #won? returns the correct winning combination in the case of a win
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  # Game #draw? returns true for a draw
  # Game #draw? returns false for a won game
  # Game #draw? returns false for an in-progress game
  def draw?
    @board.full? && !won?
  end

  # Game #winner returns X when X won
  # Game #winner returns O when O won
  # Game #winner returns nil when no winner
  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  # Game turn makes valid moves
  def turn
    player = current_player
    current_move = player.move(@board)

    if !@board.valid_move?(current_move)
      # Game turn asks for input again after a failed validation
      turn
    else
      # Game turn changes to player 2 after the first turn
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  # Game play plays through an entire game
  def play
    # Game play asks for players input on a turn of the game
    # Game play checks if the game is over after every turn
    # Game play plays the first turn of the game
    # Game play plays the first few turns of the game
    # Game play checks if the game is won after every turn
    # Game play checks if the game is a draw after every turn
    while !over?
      turn
    end
    # Game play stops playing if someone has won
    # Game play congratulates the winner X
    # Game play congratulates the winner O
    if won?
      puts "Congratulations #{winner}!"
    # Game play stops playing in a draw
    # Game play prints "Cat's Game!" on a draw
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
