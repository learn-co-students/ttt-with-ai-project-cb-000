class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]



  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def current_player
    count = 0
    @board.cells.each do |c|
      count += 1 if c == "X" || c == "O"
    end
    count.even? ? @player_1 : @player_2
  end

  def won?
    array = []
    WIN_COMBINATIONS.each do |a , b, c |
      if @player_1.token == board.cells[a] && @player_1.token == board.cells[b] && @player_1.token == board.cells[c]
        array[0], array[1], array[2] = a, b, c
      elsif @player_2.token == board.cells[a] && @player_2.token == board.cells[b] && @player_2.token == board.cells[c]
        array[0], array[1], array[2] = a, b, c
      end
    end
    array.length == 3? array : false
  end

  def draw?
    if @board.full? && !(self.won?)
      true
    else
      false
    end
  end

  def over?
    self.draw? || self.won? ? true : false
  end

  def winner
    if self.won?
      array = self.won?
      # binding.pry
      @board.cells[array[0]]
    else
      nil
    end
  end

  def turn
    input = self.current_player.move(@board)
    # binding.pry
    if !(@board.valid_move?(input))
      input = self.current_player.move(@board)
    end
    @board.update(input, self.current_player)
  end

  def play
    while !over?
      self.turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

# game = Game.new

# require_relative './config/environment'
