require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    player_1.game = self
    player_1.board = self.board
    player_2.game = self
    player_2.board = self.board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    self.board.full?
  end

  def won?
    combos = []
    WIN_COMBINATIONS.select do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
      winner = [position_1, position_2, position_3]
      if winner == ["X", "X", "X"] || winner == ["O", "O", "O"]
        combos << win_combination
      end
    end
    if combos.size != 0
      combos.last
    else
      false
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    if won?
      i = won?.first
      self.board.cells[i]
    end
  end

  def turn
    input = self.current_player.move(board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    elsif current_player.is_a?(Players::Human)
      puts "Invalid move! Please select again."
      self.turn
    end
  end

  def play
    until won? || draw? do
      puts "Now Playing: #{self.current_player.token}"
      self.turn
      self.board.display
      # sleep(0.5) **Just makes the game run at a more natural-feeling pace**
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end
