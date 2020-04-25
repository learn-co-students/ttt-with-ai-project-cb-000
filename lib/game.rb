class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if self.board.turn_count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    result = false
    WIN_COMBINATIONS.each do |win_combination|

      position_1 = self.board.cells[win_combination[0]]
      position_2 = self.board.cells[win_combination[1]]
      position_3 = self.board.cells[win_combination[2]]

      if position_1 != " " && position_1 == position_2 && position_1 == position_3
        result = win_combination
      end
    end
    result
  end

  def draw?
    if self.board.full? && !won?
      true
    else
      false
    end
  end

  def winner
    if won?
      player = won?
      return self.board.cells[player[0]]
    else
      return nil
    end
  end

  def turn
    input = self.current_player.move(self.board)
    while !self.board.valid_move?(input)
      input = self.current_player.move(self.board)
    end
    self.board.update(input, self.current_player)
  end

  def play
    until over? do
      self.board.display
      puts "\n"
      puts "~~~~~~~~~~~"
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
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
end
