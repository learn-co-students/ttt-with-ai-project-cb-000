module Players
	class Computer < Player
		def move(board)
			to_move = find_near_complete(board, token)
			return board_pos(to_move) if to_move!=nil

			to_move = find_near_complete(board, opposite_token(token))
			return board_pos(to_move) if to_move!=nil

			to_move = most_surrounded(board, opposite_token(token))
			return board_pos(to_move) if to_move!=nil

			return "5" if board.valid_move?("5")
			loop do
				to_move = Random.new().rand(9)
				break if !board.taken?(board_pos(to_move))
			end
			board_pos(to_move)
		end

		private
		def opposite_token(token)
			token == "X"? "O" : "X"
		end
		#Index to board index
		def board_pos(index)
			(index+1).to_s;
		end

		def most_surrounded(board, token)
			most_index=nil
			most_value=0
			board.cells.each_with_index do |v,i|
				count = surrounding_count(board, i, token)
				if count > most_value && board.valid_move?(board_pos(i))
					most_index = i
					most_value = count
				end
			end
			most_index
		end

		def surrounding_count(board, index, token)
			count = 0
			board.cells.each_with_index do |v, i|
				count+= 1 if i!=index && (i%3-index%3).abs <= 1 && (i/3-index/3).abs <= 1 && v == token
			end
			count
		end

		#Returns the index of a near complete win condition 2/3 of [type] that can be complted
		def find_near_complete(board, type, req=2)
			Game::WIN_COMBINATIONS.each do |combination|
				#binding.pry
				if combination.count {|i| board.cells[i]==type} == req
					combination.each_with_index do |value, index|
						return value if !board.taken?(board_pos(value))
					end
				end
			end
			nil
		end
	end
end
