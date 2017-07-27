module Players

  class Computer < Player

    def move(board)
      "#{Random.new.rand(9) + 1}"
    end

    # return the selected position
    def ai(board)
      if board[4] == ' ' && (matching_pair(board, 0, 8) || matching_pair(board, 1,7) || matching_pair(board, 2, 6) || matching_pair(board, 3, 5))
        '4'
      elsif board[0] == ' ' && (matching_pair(board, 1, 2) || matching_pair(board, 3, 6) || matching_pair(board, 4, 8))
        '0'
      elsif board[2] == ' ' && (matching_pair(board, 0, 1) || matching_pair(board, 5, 8) || matching_pair(board, 4, 6))
        '2'
      elsif board[6] == ' ' && (matching_pair(board, 0, 3) || matching_pair(board, 7, 8) || matching_pair(board, 2, 4))
        '6'
      elsif board[8] == ' ' && (matching_pair(board, 6, 7) || matching_pair(board, 2, 5) || matching_pair(board, 0, 4))
        '8'
      elsif board[1] == ' ' && (matching_pair(board, 0, 2) || matching_pair(borad, 4, 7))
        '1'
      elsif board[3] == ' ' && (matching_pair(board, 0, 6) || matching_pair(board, 4, 5))
        '3'
      elsif board[5] == ' ' && (matching_pair(board, 2, 8) || matching_pair(board, 3, 4))
        '5'
      elsif board[7] == ' ' && (matching_pair(board, 1, 4) || matching_pair(board, 6, 8))

      elsif board[4] == ' '
        '4'
      elsif board[0] == ' '
        '0'
      elsif board[2] == ' '
        '2'
      elsif board[6] == ' '
        '6'
      elsif board[8] == ' '
        '8'
      elsif board[1] == ' '
        '1'
      elsif board[3] == ' '
        '3'
      elsif board[5] == ' '
        '5'
      elsif board[7] == ' '
        '7'
      end
    end

    def matching_pair(board, p1, p2)
      (board[p1] == 'X' && board[p2] == 'X') || (board[p1] == 'O' || board[p2] == 'O')
    end

  end

end
