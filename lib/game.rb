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
    @board.full? || won? != false
  end

  def won?
    win_combo = WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] != " " && @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]]
    end
    win_combo == nil ? false : win_combo
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    return nil if won? == false
    return @player_1.token if won?.all? {|p| @board.cells[p] == @player_1.token}
    return @player_2.token if won?.all? {|p| @board.cells[p] == @player_2.token}
  end

  def turn
    move = nil
    while move == nil
      puts "Player #{current_player.token}, take your turn:"
      player = @player_1.token == current_player.token ? @player_1 : @player_2
      move = player.move(@board.cells)
    end
    return move
  end

  def play
    until over?
      @board.display
      turn
    end
    @board.display
    puts "Cat\'s Game!" if draw?
    puts "Congratulations #{winner}!" if won?
  end

  def self.start
    game = false
    continue = ""
    until continue == 'exit' || continue == 'no'
      puts game == false ? "Welcome to Tic-Tac-Toe with AI!!!" : "Welcome to back to Tic-Tac-Toe with AI!!! It's great to see you again!"
      puts "Enter \'0-player game\' for two computer players playing against each other."
      puts "Enter \'1-player game\' to play against a computer."
      puts "Enter \'2-player game\' for two human players:"
      game_type = gets.strip
      puts "Who should go first? Enter \'X\' or \'O\'?" if game_type == "0-player game" || game_type == "2-player game"
      puts "You'll make the first move! Would you like to be \'X\' or \'O\'?:" if game_type == "1-player game"
      token_1 = gets.strip
      token_1.upcase
      token_2 = "O" if token_1 == "X"
      token_2 = "X" if token_1 == "O"
      case game_type
        when "0-player game"
          game = Game.new(Players::Computer.new(token_1), Players::Computer.new(token_2))
        when "1-player game"
          game = Game.new(Players::Human.new(token_1), Players::Computer.new(token_2))
        when "2-player game"
          game = Game.new(Players::Human.new(token_1), Players::Human.new(token_2))
      end
      game.play
      puts "Would you like to play again?\nIf not enter \'exit\', otherwise enter \'yes\':"
      continue = gets.strip.downcase
    end
    puts "Thanks for playing!!!"
  end
end
