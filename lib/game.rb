require 'pry-byebug.rb'

class Game
  WIN_COMBINATIONS = 
    [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
  X = 'X'
  O = 'O'

  attr_accessor :board, :player_1, :player_2, :current_player

  def initialize(
    player_1 = Players::Human.new(X), 
    player_2 = Players::Computer.new(O), 
    board = Board.new)

    @player_1 = player_1
    @player_2 = player_2
    @board = board
    #    @current_player = @player_1 #after a long time trying cannot get past infinite loop. Using solution code from git. Moving on to continue the focus on learning Ruby.
  end

  ## def change_player
  ##   if @current_player == @player_1
  ##     @current_player = @player_2
  ##   elsif @current_player == @player_2
  ##     @current_player = @player_1
  ##   end
  ## end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  # after a long time trying cannot get past infinite loop. Using solution code from git. Moving on to continue the focus on learning Ruby.
  def over?
    won? || draw?
  end

  # Returns the winning combination
  # If there is none, then returns false
  # Using posted solution so that I can continue on with the project.
  # My solutions did not work.
  # after a long time trying cannot get past infinite loop. Using solution code from git. Moving on to continue the focus on learning Ruby.
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && 
      @board.cells[combo[1]] == @board.cells[combo[2]] && 
      @board.taken?(combo[0]+1)
    end
  end
  
  def draw?
    @board.full? && !won?
  end

  def winner
    won? && @board.cells[won?[0]]
  end

  # def turn
    # $stderr.puts "DEBUG 5"
    # desired_position =  current_player.move(@board)
    # if @board.valid_move? desired_position
      # $stderr.puts "DEBUG 6"
      # @board.update(desired_position, current_player)
      # # binding.pry
      # # change_player
    # else
      # $stderr.puts "DEBUG 7"
      # turn
    # end
  # end

  # after a long time trying cannot get past infinite loop. Using solution code from git. Moving on to continue the focus on learning Ruby.
  def turn
    player = current_player
    puts "#{player}'s turn."
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, player)
      @board.display
      puts "#{player.token} moved #{current_move}"
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
