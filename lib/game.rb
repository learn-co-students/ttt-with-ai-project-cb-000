class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.cells.select {|cell| cell == @player_1.token}.size <= @board.cells.select {|cell| cell == @player_2.token}.size ? @player_1 : @player_2
  end

  def over?
    @board.full? || self.won? != nil
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] != " " && @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]]
    end
  end

  def draw?
    self.won? == nil && @board.full?
  end

  def winner
    return nil if won? == nil
    return @player_1.token if won?.all? {|p| @board.cells[p] == @player_1.token}
    return @player_2.token if won?.all? {|p| @board.cells[p] == @player_2.token}
  end

  def turn
    move = nil
    while move == nil
      @board.display
      puts "Player #{current_player.token}, take your turn:"
      player = @player_1.token == current_player.token ? @player_1 : @player_2
      move = player.move(@board.cells)
    end
    return move
  end

  def play
    until over?
      turn
    end
    puts "Cat\'s Game!" if self.draw?
    puts "Congratulations #{winner}!" if self.won?
  end

end
