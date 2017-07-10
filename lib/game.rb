class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS=[
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #middle column
    [2, 5, 8], #last column
    [0, 4, 8], #diagonal 1
    [2, 4, 6], #diagonal 2
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def draw?
    !(won?) && @board.full?
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] && @board.cells[winner[1]] == @board.cells[winner[2]] && @board.taken?(winner[0]+1)
    end
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end


  def turn
    player = current_player
    move = player.move(@board)
    if @board.valid_move?(move)
      puts "Great move, #{player.token}!"
      @board.update(move, player)
      @board.display
    else
      puts "Invalid move! Choose a number between 1 - 9 or a spot that has not yet been taken"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      @board.display
    elsif draw?
      puts "Cat's Game!"
    end
  end



end
