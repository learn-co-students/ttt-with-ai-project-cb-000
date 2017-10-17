class Game
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

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = p1
    @player_2 = p2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_index|
      (@board.cells[win_index[0]] == "X" && @board.cells[win_index[1]] == "X" && @board.cells[win_index[2]] == "X") || (@board.cells[win_index[0]] == "O" && @board.cells[win_index[1]] == "O" && @board.cells[win_index[2]] == "O")
    end
  end

  def draw?
    return false if won?
    if @board.full?
      return true
    else
      return false
    end
  end

  def over?
    return true if won? || @board.full? || draw?
  end

  def winner
    win = won?
    if win
      return @board.cells[win[0]]
    end
  end

  def start
  end

  def play
    result = ""
    @board.display
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      result = winner
    else
      puts "Cat's Game!"
      result = "D"
    end
    result
  end

  def turn
    player = current_player
    puts "It is #{player.token}'s turn!"
    input = player.move(@board)
    until @board.valid_move?(input)
      input = player.move(@board)
    end
    @board.update(input, player)
    @board.display
  end
end
