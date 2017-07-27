module Players

  class Computer < Player

    def move(board)
      # "#{Random.new.rand(9) + 1}"
      ai(board)
    end

    private
    # return the selected position
    def ai(board)
      state = board.cells
      if state[4] == ' ' && (matching_pair(board, 0, 8) || matching_pair(board, 1,7) || matching_pair(board, 2, 6) || matching_pair(board, 3, 5))
        '5'
      elsif state[0] == ' ' && (matching_pair(board, 1, 2) || matching_pair(board, 3, 6) || matching_pair(board, 4, 8))
        '1'
      elsif state[2] == ' ' && (matching_pair(board, 0, 1) || matching_pair(board, 5, 8) || matching_pair(board, 4, 6))
        '3'
      elsif state[6] == ' ' && (matching_pair(board, 0, 3) || matching_pair(board, 7, 8) || matching_pair(board, 2, 4))
        '7'
      elsif state[8] == ' ' && (matching_pair(board, 6, 7) || matching_pair(board, 2, 5) || matching_pair(board, 0, 4))
        '9'
      elsif state[1] == ' ' && (matching_pair(board, 0, 2) || matching_pair(board, 4, 7))
        '2'
      elsif state[3] == ' ' && (matching_pair(board, 0, 6) || matching_pair(board, 4, 5))
        '4'
      elsif state[5] == ' ' && (matching_pair(board, 2, 8) || matching_pair(board, 3, 4))
        '6'
      elsif state[7] == ' ' && (matching_pair(board, 1, 4) || matching_pair(board, 6, 8))
        '8'
      elsif state[4] == ' '
        '5'
      elsif state[0] == ' '
        '1'
      elsif state[2] == ' '
        '3'
      elsif state[6] == ' '
        '7'
      elsif state[8] == ' '
        '9'
      elsif state[1] == ' '
        '2'
      elsif state[3] == ' '
        '4'
      elsif state[5] == ' '
        '6'
      else
        '8'
      end
    end

    def matching_pair(board, p1, p2)
      state = board.cells
      (state[p1] == 'X' && state[p2] == 'X') || (state[p1] == 'O' && state[p2] == 'O')
    end

  end

end
