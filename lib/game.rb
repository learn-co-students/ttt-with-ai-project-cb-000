class Game
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @player_1.opponent = player_2
    @player_2.opponent = player_1
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def find_player_positions(player)
    positions = []
    self.board.cells.each_with_index do |value, index|
      positions << index if value == player.token
    end

    positions
  end

  def won?
    winning_combo = false
    WIN_COMBINATIONS.each do |combo|
      winning_combo = combo if winning_combo?(combo, self.player_1) || winning_combo?(combo, self.player_2)
    end
    winning_combo
  end

  def winning_combo?(combo, player)
    positions = player.find_player_positions(self.board)
    (positions + combo).uniq.count == positions.count
  end

  def draw?
    self.board.turn_count == 9 && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    combo = self.won?
    if combo
      winning_combo?(combo, self.player_1) ? player_1.token : player_2.token
    end
  end

  def turn
    self.board.display
    input = ""
    while !self.board.valid_move?(input)
      input = self.current_player.move(self.board)
    end
    self.board.update(input, self.current_player)
  end

  def play
    while !self.over?
      self.turn
    end

    self.board.display
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
