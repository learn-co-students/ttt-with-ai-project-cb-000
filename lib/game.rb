class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
	    [0,1,2], # Top row
	    [3,4,5],  # Middle row
	    [6,7,8], # Bottom row
	    [0,3,6], # First column
	    [1,4,7], # Second column
	    [2,5,8], # Third column
	    [0,4,8], #diagonal
	    [2,4,6] #other diagonal
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
		if board.turn_count.even?
			@player_1
			# This is an instance of the Human player object
		else
			@player_2
			# This is an instance of the Human player object
		end
	end

	def start
	end

	def play
	end

	def turn
	    puts "Please enter 1-9:"
	    input = gets
	    input ||= "1"
	    input = input.strip.to_i
	    if board.valid_move?(input)
	      user_char = current_player #board.update extracts the token
	      board.update(input, user_char)
	      board.display
	    else
	      turn
	    end
  	end


	def won?
		WIN_COMBINATIONS.detect do |combo|
			@board.cells[combo[0]] == @board.cells[combo[1]] &&
			@board.cells[combo[1]] == @board.cells[combo[2]] &&
			@board.taken?(combo[0] + 1)
		end
  	end

  	def full?
    	@board.cells.all? { |pos| pos == "X" || pos == "O" }
  	end

  	def draw?
      if full? && !won?
        true
      else
        false
      end
    end

	def over?
		if won? || draw? || full?
	  		true
		end
	end

	def winner
		if won?
			win_pos = won?
			@board.cells[win_pos[0]]
		else
			nil
		end
    end

end


    