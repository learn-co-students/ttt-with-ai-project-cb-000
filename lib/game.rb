class Game

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find{|comb| comb.all?{|pos| @board.cells[pos] == "X"} || comb.all?{|pos| @board.cells[pos] == "O"}}
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    move = ""
    loop do
      move = current_player.move(@board)
      break if @board.valid_move?(move)
    end
    @board.update(move, current_player)
    @board.display
    puts ""
  end

  def play
    loop do
      break if over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def start
    input = ""
    system "clear"
    puts "Welcome to Tic-tac-toe v1.0"
    puts ""
    puts "1. 0-Player game mode (computer plays itself)"
    puts "2. 1-Player game mode (human against computer)"
    puts "3. 2-Player game mode (human against human)"
    puts "4. Wargames mode"
    puts "5. Exit"
    puts ""
    puts "Selection: "
    loop do
      input = gets.strip
      break if (1..5).include?(input.to_i)
    end
    case input
    when "1"
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      self.board.reset!
      self.board.display
      self.play
    when "2"
      self.player_1 = Players::Human.new("X")
      self.player_2 = Players::Computer.new("O")
      self.board.reset!
      self.board.display
      self.play
    when "3"
      self.player_1 = Players::Human.new("X")
      self.player_2 = Players::Human.new("O")
      self.board.reset!
      self.board.display
      self.play
    when "4"
      self.wargames
    when "5"
      return
    end
    puts ""
    puts "Would you like to play again? (y/n)"
    loop do
      input = gets.strip
      break if input == "y" || input == "Y" || input == "YES" || input == "yes" || input == "n" || input == "N" || input == "NO" || input == "no"
    end
    case input
    when "y", "Y", "YES", "yes"
      self.start
    when "n", "N", "NO", "no"
    end
  end

    def wargames
      wins = 0
      draws = 0
      100.times do
        self.player_1 = Players::Computer.new("X")
        self.player_2 = Players::Computer.new("O")
        self.board.reset!
        self.board.display
        self.play
        wins += 1 if self.won?
        draws += 1 if self.draw?
      end
      puts ""
      puts "100 games were played and there were #{wins} wins and #{draws} draws."
    end
end
