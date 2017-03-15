class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
		[0,1,2], # Top row
		[3,4,5], # Middle row
		[6,7,8], # Bottom row
		[0,3,6], # First column
		[1,4,7], # Second column
		[2,5,8], # Third column
		[0,4,8], # LR diagonal
		[2,4,6]  # RL diagonal
	]

	# Sets up the board and players, with defaults set
	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	# Determines whose turn it is
	def current_player
		@board.turn_count % 2 == 0 ? player_1 : player_2
	end

	# Determines if the game is over
	def over?
		won? || draw?
	end

	# Determines if the game has been won
	def won?
		WIN_COMBINATIONS.detect do |win_combo|
			@board.cells[win_combo[0]] == @board.cells[win_combo[1]] && @board.cells[win_combo[0]] == @board.cells[win_combo[2]] && @board.taken?(win_combo[0]+1)
		end
	end

	# Determines if the game is a draw
	def draw?
		!won? && @board.full?
	end

	# Returns the winner's token or nil if the game has not been won
	def winner	
		if !won?
			nil
		elsif @board.cells[won?[0]] == "X"
			@player_1.token
		elsif @board.cells[won?[0]] == "O"
			@player_2.token	
		end
	end

	def turn
  		player = current_player
  		puts "\n\n#{player.token}'s move"
  		current_move = current_player.move(@board)
  		turn if !@board.valid_move?(current_move)
    	@board.update(current_move, current_player)
	    puts "#{player.token} moved #{current_move}"
    	@board.display
	end

	def play
		board.display
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