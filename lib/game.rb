class Game
	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

	attr_accessor :player_1, :player_2, :board

	def initialize (player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		@board.turn_count % 2 ==0 ? @player_1 : @player_2
	end

	def won?
		result = false
		WIN_COMBINATIONS.each do |c|
			if @board.cells[c[0]] != " " && @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[1]] == @board.cells[c[2]]
				result = true
			end
		end
		result
	end

	def draw?
		@board.full? == true && self.won? == false
	end

	def over?
		self.draw? || self.won?
	end

	def winner
		result = nil
		WIN_COMBINATIONS.each do |c|
			if @board.cells[c[0]] != " " && @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[1]] == @board.cells[c[2]]
				result = @board.cells[c[0]]
			end
		end
		result
	end	

	def turn
		@board.display
		move = current_player.move(@board)
		if @board.valid_move?(move) == true
			@board.update(move, current_player)
		else
			self.turn
		end
	end

	def play
		while self.over? == false
			self.turn
		end
	#	@board.display
		if self.won?
			puts "Congratulations #{winner}!"
		else
			puts "Cat's Game!"
		end
	end





end
