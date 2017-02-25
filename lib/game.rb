class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Last row
    [0,4,8], # First Diagnoal
    [2,4,6], # Second Diagnoal
    [0,3,6], # First Column
    [1,4,7], # Second Column
    [2,5,8] # Third Column
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    count = 0
    self.board.cells.each do |entry|
      count += 1  if (entry == 'X' || entry == 'O')
    end
    count
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    !won? && self.board.full? ? true : false
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      self.board.cells[win_combination[0]] != ' ' && self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] && self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]]
    end
  end

  def winner
    winning_combo = WIN_COMBINATIONS.detect do |win_combination|
      self.board.cells[win_combination[0]] != ' ' && self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] && self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]]
    end
    if winning_combo != nil
      self.board.cells[winning_combo[0]]
    end
  end

  def turn
    input = nil

    if current_player.class == Players::Computer
      input = current_player.move(self.board)
    else
      input = current_player.move(current_player.token)
      unless self.board.valid_move?(input)
        puts 'Invalid choice.'
        input = current_player.move(current_player.token)
      end
    end
    self.board.update(input, current_player)
  end

  def play
    until over? do
      self.turn
      board.display
    end
    puts "Congratulations #{winner}!" if winner != nil
    puts "Cat's Game!" if draw?
  end
end
