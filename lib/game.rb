class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [ [0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7], [2, 5, 8], [3, 4, 5], [6, 4, 2], [6, 7, 8] ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    combo = WIN_COMBINATIONS.find_all do |array|
      (array.map {|spot| board.cells[spot]}.uniq.length == 1) && (board.cells[array[1]] != " ")
    end

    combo.length > 0 ? combo.last : false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9:"
    current_move = current_player.move(board)

    if board.valid_move?(current_move)
      board.update(current_move, current_player)
      board.display
    else
      turn
    end
  end

  def play
    turn until over?

    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

  def self.WIN_COMBINATIONS
    WIN_COMBINATIONS
  end

end
