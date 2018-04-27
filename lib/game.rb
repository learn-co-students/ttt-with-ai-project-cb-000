require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,4,8],
                      [2,4,6],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8]]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    win = WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|position| @board.cells[position] == "X"} || win_combination.all? {|position| @board.cells[position] == "O"}
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    move = current_player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      puts "\n"
      @board.update(move, current_player)
      puts "moved to square #{move}"
      @board.display
      puts "\n"
    end
  end

  def play
    turn while !over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def start
    input = ""
    while input != "q"
      puts "Welcome to Tic Tac Toe!"
      puts "Enter \'0\' to spectate 2 computer players"
      puts "Enter \'1\' to play against the computer"
      puts "Enter \'2\' to play with a friend"
      puts "Enter \'q\' to quit"
      input = gets.chomp.downcase
      case input
      when "0"
        spectate
      when "1"
        one_player
      when "2"
        two_player
      end
    end
  end

  def spectate
    token = pick_token
    if token == "X"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
    else
      player_1 = Players::Computer.new("O")
      player_2 = Players::Computer.new("X")
    end
    Game.new(player_1, player_2).play
  end

  def one_player
    token = pick_token
    if token == "X"
      player_1 = Players::Human.new("X")
      player_2 = Players::Computer.new("O")
    else
      player_1 = Players::Human.new("O")
      player_2 = Players::Computer.new("X")
    end
    Game.new(player_1, player_2).play
  end

  def two_player
    token = pick_token
    if token == "X"
      player_1 = Players::Human.new("X")
      player_2 = Players::Human.new("O")
    else
      player_1 = Players::Human.new("O")
      player_2 = Players::Human.new("X")
    end
    Game.new(player_1, player_2).play
  end

  def pick_token
    ["X", "O"].sample
  end

end
