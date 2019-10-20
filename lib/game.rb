class Game

	WIN_COMBINATIONS = [
		[0,1,2],[3,4,5],[6,7,8],#horizontal combinations
		[0,3,6],[1,4,7],[2,5,8],#vertical combinations
		[0,4,8],[2,4,6]]#diaginal combinations

		attr_accessor :board, :player_1, :player_2

		def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new())
			@board = board;
			@player_1 = player_1;
			@player_2 = player_2;
		end

		def play(do_print=true)
				while !over?
					turn(do_print)
					#binding.pry
				end
				board.display if do_print
				if winner==nil
					puts "Cat's Game!" if do_print
				else
					puts "Congratulations #{winner}!" if do_print
				end
		end

		def turn(do_print=true)
			board.display if do_print
			puts "Make your move #{current_player.token}: " if do_print
			board.update(current_player.move(board), current_player)
		end

		def current_player
			return board.turn_count.even? ? player_1 : player_2
		end

		def over?
			draw? || won?
		end

		def won?
			winner!=nil
		end

		def draw?
			board.full? && !won?
		end

		def winner
			WIN_COMBINATIONS.each do |comination|
				return "X" if comination.all? {|i| board.cells[i]=="X"}
				return "O" if comination.all? {|i| board.cells[i]=="O"}
			end
			nil
		end

		def reset!
			board.reset!
		end

end
