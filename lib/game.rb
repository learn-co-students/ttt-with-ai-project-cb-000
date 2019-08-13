class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1, @player_2, @board = player_1, player_2, board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    @board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      return win if win.all?{|y| @board.cells[y] == 'X'}
      return win if win.all?{|y| @board.cells[y] == 'O'}
    end
    false
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    @board.cells[won?[0]] if !!won?
  end

  def turn
    loop do
      play = current_player.move(@board)
      if @board.valid_move?(play)
        @board.update(play, current_player)
        break
      end
    end
  end

  def play
    while !over?
      turn
      @board.display
    end
    puts !!winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def self.start_game
    count = 0

    puts "Welcome to this fun and exciting game of Tic Tac Toe"
    puts "How many human players will be in this game: 0, 1, or 2?"
    count = gets.to_i
    case count
    when 0
      player_1 = Players::Computer.new('X')
      player_2 = Players::Computer.new('O')
      game = Game.new(player_1, player_2)
    when 1
      puts "Should you play first: Y/N?"
      player_first = gets.chomp
      if player_first == 'Y'
        player_1 = Players::Human.new('X')
        player_2 = Players::Computer.new('O')
      else
        player_1 = Players::Computer.new('X')
        player_2 = Players::Human.new('O')
      end
      game = Game.new(player_1, player_2)
    when 2
      game = Game.new
    else
      start_game
    end
    game.play
  end
end
