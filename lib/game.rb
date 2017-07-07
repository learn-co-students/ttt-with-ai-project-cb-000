require 'pry'



class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2

  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end


  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board.cells[combo[0]] == 'X' && @board.cells[combo[1]] == 'X' && @board.cells[combo[2]] == 'X') || (@board.cells[combo[0]] == 'O' && @board.cells[combo[1]] == 'O' && @board.cells[combo[2]] == 'O')
        return @board.cells[combo[0]]
      end
    end
    nil
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won?
  end

  def over?
    won? || draw?
  end

  def turn

    @board.display if (player_1.class == Players::Human || player_2.class == Players::Human)
    move = current_player.move(@board).to_i
    until @board.valid_move?(move)
      move = current_player.move(@board).to_i
    end
    @board.update(move,current_player)
  end

  def play

    turn until over?
    if won?
      puts "Congratulations #{won?}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
