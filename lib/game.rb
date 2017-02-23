require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # count the number of turns currently in board's @cells array
  # if the count divided by 2 is equal to 0, return player_1.
  # note: if the board has two cells filled, it's #1's turn.
  # note: player_1's moves are odd
  # else, return player_2
  # def current_player
  #   board.turn_count % 2 == 0 ? player_1 : player_2
  # end
  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  # describe '#current_player' do
  #   it 'returns the correct player, X, for the third move' do
  #     game = Game.new
  #     game.board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", " "]
  #
  #     expect(game.current_player.token).to eq("X")
  #   end
  # end

  def over?
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

  def combos
    WIN_COMBINATIONS
  end

  def won?
    WIN_COMBINATIONS.detect do |wc|
      board.cells[wc[0]] == board.cells[wc[1]] &&
      board.cells[wc[1]] == board.cells[wc[2]] &&
      board.taken?(wc[0] + 1)
    end
  end
  # def taken?(move)
  #   x = move.to_i - 1
  #   @cells[x] == "X" || @cells[x] == "O"
  # end

  # def won?
  #   WIN_COMBINATIONS.detect do |combo|
  #     @board.cells[combo[0]] == @board.cells[combo[1]] &&
  #     @board.cells[combo[1]] == @board.cells[combo[2]] &&
  #     @board.taken?(combo[0]+1)
  #   end
  # end

  def draw?
    board.full? && !won?
  end

  # def winner
  #   if x = won?
  #     # If x = the first win combo that's true
  #     y = board.cells[x[0]]
  #     # then y = board.cells[win combo index zero]
  #   end
  # end

  # def winner
  #   if x = won?
  #     board.cells[x[0]]
  #   end
  # end
  # takes the winning index of #won? and applies it to cells[index], returning cells[index]
  def winner
    board.cells[won?[0]] if won?
  end
  # if the game has been won (via #won? being true)
  # then return board.cells[won?[0]] which is:
  # the first index, an X or an O, of a win combo

#   def winner
#   if winning_combo = won?
#     @winner = @board.cells[winning_combo.first]
#   end
# end

  def turn
    cp = current_player
    cm = cp.move(board)
    if !board.valid_move?(cm)
      puts "That's not a valid move. It's either taken or out of range."
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
      puts "Cat's Game!"
    end
  end



# play
# congratulates the winner X (FAILED - 1)
#     congratulates the winner O (FAILED - 2)
#     prints "Cat's Game!" on a draw (FAILED - 3)
#     plays through an entire game (FAILED - 4)

end
