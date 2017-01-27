module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      if !board.taken?(5)
        "5"
      elsif x = threat?.detect{|wc| game.board.cells[wc[0]] == game.board.cells[wc[2]]}
        x[wc[1]].to_s if !taken?
      # if threat?.any?'s detect finds a match, return the match and store it as a variable, then use the variable to return the middle index of a win combo.

      else
        valid_moves.sample.to_s
      end
    end

    def threat?
      game.WIN_COMBINATIONS
    end

  end
end

    # This is roughly the dumbest "AI" I could employ and pass. Obviously, it could go a lot deeper via conditionals. This AI has the center of the board, great, but it could opt for optimal moves strategies via other conditioanls.
