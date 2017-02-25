require 'pry'

class Game

	attr_accessor :board, :player_1, :player_2, :ui

	WIN_COMBINATIONS = [
		[0, 1, 2], [3, 4, 5],	[6, 7, 8], # horizontal rows

		[0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical rows

		[0, 4, 8], [2, 4, 6] # diagonals
	]

	def initialize(
			player_1=Players::Human.new('X'), 
			player_2=Players::Human.new('O'), 
			board=Board.new
		)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
	end

	def won?
		WIN_COMBINATIONS.detect do |combo|
			self.board.cells[combo[0]] == self.board.cells[combo[1]] && 
			self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
			self.board.taken?((combo[0] + 1).to_s)
		end
	end

	def draw?
		self.board.full? && !self.won?
	end

	def over?
		self.draw? || self.won?
	end

	def winner
		win_combo = self.won?
		if win_combo
			self.board.cells[win_combo[0]]
		end
	end

	def turn
		player = self.current_player
		position = player.move(self.board) while !self.board.valid_move?(position)
		self.ui.clear_screen
		self.board.update(position, player)
		self.board.display
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