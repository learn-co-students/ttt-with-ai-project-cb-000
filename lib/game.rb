require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :winning_player ## not included by Henno
  WIN_COMBINATIONS = [  ##these are indexes of board array.
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def initialize(p1 = Players::Human.new("X"), p2= Players::Human.new("O"), board= Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = board
  end

  def play
    while !over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|

      if @board.taken?(combo[0]+1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]

        @winning_player = @board.cells[combo[0]]

      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if combo = self.won?
    
      @winning_player
    end
  end

  def turn

    puts "#{current_player.token} Please enter a number"

    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
      board.display
    else
      puts "invalid"
      turn
    end
  end
end
