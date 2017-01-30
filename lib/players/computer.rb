module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      if !board.taken?(5)
        "5"
      else
        valid_moves.sample.to_s
      end
    end

  end
end

  #   def move(board)
  #   valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  #   if !board.taken?(5)
  #     "5"
  #   else
  #     make_move
  #   end
  # end
  #
  #
  # private
  # def make_move
  #   move = nil
  #   # x = opportunity #Any combo with 2 opponent + empty
  #   x = threats if x == nil #Any combo with 2 of ours + empty
  #   x = @valid_moves.sample if x == nil #make random move if no threats or opportunities
  #   return x
  # end
  #
  # def threats
  #   x = nil
  #   game.WIN_COMBINATIONS.each do |combo|
  #     if #2 in a row
  #       x = #empty square
  #   end
  #   x
  # end
  #
  # (board.cells[combo[0]] + board.cells[combo[1]] + board.cells[combo[2]]).join(" ").gsub(/\s/,"") == "XX"
  #
  # move = combo.select {|c| @valid_moves.any?(c)}[0]

    # def move(board)
    #   valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    #   if !board.taken?(5)
    #     "5"
    #   elsif Game::WIN_COMBINATIONS.any? do |i|
    #     board.cells[i[0]] == board.cells[i[2]]
    #       y = Game::WIN_COMBINATIONS.detect{|i| board.cells[i[0]] == board.cells[i[2]]}
    #       [i[1]].to_s
    #   else
    #     valid_moves.sample.to_s
    #   end
    # end

    # def threat?
    #   Game::WIN_COMBINATIONS.any? do |i|
    #     Board.cells[i[0]] == Board.cells[i[2]]
    #   end
    # end

    # def block
    #   x = Game::WIN_COMBINATIONS.detect{|i| Board::cells[i[0]] == Board::cells[i[2]]}
    #     x[i[1]].to_s if !board.taken?(i[1])
    # end
    # def threat?(board)
    #   game.WIN_COMBINATIONS.each do |wc|
    #     win_vals = board.cells.values_at(*wc)
    #     if win_vals.count('X') == 2 and win_vals.count('0') == 0
    #       return wc
    #     end
    #   end
    # end
    #
    # def threat?(board)
    # 	WIN_COMBINATIONS.each do |wc|
    # 		win_vals = board.cells.values_at(*wc)
    # 		if win_vals.count('X') == 2 and win_vals.count('0') == 0
    # 			return wc
    # 		end
	  #   end
    # end
    #
    # WIN_COMBINATION.each |wc| do
    # 	wc_vals = board.cells.values_at(*wc)
    # 	if wc_vals.count('X') == 2 and wc_vals.count('O') == 0
    # 		# block this move
    # 	else
    # 		# do random move
    # 	end
    # end

  # elsif Game::WIN_COMBINATIONS.any? do |i|
  #   board.cells[i[0]] == board.cells[i[2]]
  #     y = Game::WIN_COMBINATIONS.detect{|i| board.cells[i[0]] == board.cells[i[2]]}
  #     [i[1]].to_s
