require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
    [1, 4, 7]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |wc|
      board.cells[wc[0]] == board.cells[wc[1]] && board.cells[wc[2]] == board.cells[wc[0]] && board.taken?(wc[0]+1)
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    cp = current_player #=> either player_1 or player_2
    cm = cp.move(board)
    if !board.valid_move?(cm)
      puts "That's not a valid move. Please try another move."
      turn
    else
      puts "\n"
      board.update(cm, cp)
      board.display
      puts "\n"
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
