class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]] == "X" && board.cells[combo[1]] =="X" && board.cells[combo[2]] == "X") || (board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    player = current_player
    move = player.move(board)
    if board.valid_move?(move)
      puts "Good job!"
      board.update(move, player)
      board.display
    else
      puts "Invalid move! Please enter a number between 1 and 9:"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "How many human players are there?: 0, 1, or 2?"
    input = gets.strip.to_i
    if input == 2
      game = Game.new
    elsif input == 1
      game = Game.new(Players::Computer.new("X"))
    elsif input == 0
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    else
      puts "Invalid number of humans!"
      start
    end
    until game.won? || game.draw?
      game.play
    end
    puts "Play again? y/n:"
    start if gets.strip.downcase == "y"
  end
end
