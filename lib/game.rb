require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player #=> Returns the player whose turn it is.
    board.turn_count.even? ? player_1 : player_2
  end

  def over? #=> Returns true/false
    draw? || won?
  end

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

  def won? #=> Logic to dermine a winner. Returns the matching array if there is one.
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[0]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
    end
  end

  def draw? #=> Returns true/false.
    board.full? && !won?
  end

  def winner #=> Returns the token of the winning player.
    board.cells[won?[0]] if won?
  end

  def turn
    player = current_player #=> Recieves the inst. of the player via #current_player.
    move = player.move(board) #=> Recieves the move of the player inst. via #move.
    if !board.valid_move?(move)
      puts "That's not a valid move. Make a new move."
      turn
    else
      board.update(move, player) #=> Places the players token on the board.
      board.display #=> Displays the updated board.
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
