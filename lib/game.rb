class Game

  attr_accessor :board, :player_1, :player_2

  @@player_1 = @player_1
  @@player_2 = @player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]



  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @@player_1 = @player_1
    @@player_2 = @player_2

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
    if !(@board.valid_move?(input))
      input = self.current_player.move(@board)
    end
    @board.update(input, self.current_player)
  end


  def play
    while !over?
      @board.display
      self.turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
      @board.display
    elsif draw?
      puts "Cat's Game!"
      @board.display
    end
  end

  def self.start
    playing = "y"
    while playing == "y"
      puts "Welcome to Tic-Tac-Toe!"
      puts "How many players? (1, 2 or 0)"
      input = gets.strip
      # puts "Who should go first and be \"X\" (Player 1, Player 2 or Computer)"
      # input2 = gets.strip
      case input
        when "0"
          game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),board = Board.new)
        when "1"
          game = Game.new(Players::Human.new("X"),Players::Computer.new("O"),board = Board.new)
        when "2"
          game = Game.new(Players::Human.new("X"),Players::Human.new("O"),board = Board.new)
        else
          input = "0"
      end
      # binding.pry

      # if input == 0
      #   puts "Computer vs. Computer"
      #   game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),board = Board.new)
      # elsif input == 1
      #   if input2 == 1
      #     game = Game.new(Players::Human.new("X"),Players::Computer.new("O"),board = Board.new)
      #   else
      #     game = Game.new(Players::Computer.new("X"),Players::Human.new("O"),board = Board.new)
      #   end
      # elsif input == 2
      #   if input2 == 1
      #     game = Game.new(Players::Human.new("X"),Players::Human.new("O"),board = Board.new)
      #   else
      #     game = Game.new(Players::Human.new("X"),Players::Human.new("O"),board = Board.new)
      #   end
      # else
      #   game = Game.new()
      # end
      game.play
      puts "Play Again? y or n"
      playing = gets.strip
    end
  end

  def self.player_1
    @@player_1
  end

  def self.player_2
    @@player_2
  end

end

# game = Game.new

# require_relative './config/environment'
