require "pry"

module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      #binding.pry
      local_win_combinations = Game.win_combinations_exporter
      updated_board = board.cells
      #binding.pry
      if updated_board[4] == " "
        return valid_moves[4]
      elsif updated_board[0] == " "
        return valid_moves[0]
      elsif  updated_board[2] == " "
        return valid_moves[2]
      elsif updated_board[6] == " "
        return valid_moves[6]
      elsif updated_board[8] == " "
        return valid_moves[8]
      else
        valid_moves.sample
      end
    end
  end
end
