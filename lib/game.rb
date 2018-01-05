class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    puts "X: #{@board.cells.select {|cell| cell == @player_1.token}.size}"
    puts "O: #{@board.cells.select {|cell| cell == @player_2.token}.size}"
    #puts @board.cells.select {|cell| cell == @player_1.token}.size >= @board.cells.select {|cell| cell == @player_2.token}.size ? @player_1 : @player_2
    @board.cells.select {|cell| cell == @player_1.token}.size <= @board.cells.select {|cell| cell == @player_2.token}.size ? @player_1 : @player_2
  end

  def over?
    @board.full? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]]
    end
  end

  def draw?
    @board.full? && !self.won?
  end

  def winner
   return @player_1.token if won?.all? {|p| @board.cells[p] == @player_1.token}
   return @player_2.token if won?.all? {|p| @board.cells[p] == @player_2.token}
  end

  def turn
    puts current_player.token
    move = nil
    while move == nil
      player = @player_1.token == current_player.token ? @player_1 : @player_2
      move = player.move(@board.cells)
    end
    return move
  end

end
