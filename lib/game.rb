class Game

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Array.new(9, " "))
    @board = board
    @player_1 = player_1 
    @player_2 = player_2 
  end

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def won?
    WIN_COMBINATIONS.detect {|i| @board.taken?(i[0]) && @board.cells[i[0]] == @board.cells[i[1]] && @board.cells[i[0]] == @board.cells[i[2]] }
  end

  def draw?
    board.full? && !won?
  end

  def over?
     won? || draw?
  end

  def current_player
    board.turn_count % 2 == 0 ? "X" : "O"
  end

  def winner
    if line = won?
      return board.cells[line[0]]
    else return nil
    end
  end

  def play
    i = 1
    while (i <= 9) do
      if (!over?)   #This is completely uneeded, except to pass the tests. :-(
        position
      end
      if (won?)
        puts "Congratulations #{winner}!"
        return
      elsif (draw?)
        puts "Cat's Game!"
        return
      end
      i += 1
    end
  end

end
