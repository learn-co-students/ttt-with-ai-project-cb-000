require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), 
                 player_2 = Players::Human.new("O"), 
                 board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.any? do |line|
      board.cells[line[0]] != " " && board.cells[line[0]] == board.cells[line[1]] && board.cells[line[1]] == board.cells[line[2]]
    end
  end

  def draw?
    board.full? && !self.won?
  end

  def winner
    winning_line = WIN_COMBINATIONS.detect do |line|
      board.cells[line[0]] != " " && board.cells[line[0]] == board.cells[line[1]] && board.cells[line[1]] == board.cells[line[2]]
    end

    if winning_line
      board.cells[winning_line[0]]
    end
  end

  def turn
    input = nil

    if current_player.class == Players::Computer
      input = current_player.move(board)
    else
      loop do
        input = current_player.move(current_player.token)
        break if self.board.valid_move?(input)
      end
    end

    self.board.update(input, current_player)
  end

  def play
    while !over?
      self.turn
      board.display
    end

    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end