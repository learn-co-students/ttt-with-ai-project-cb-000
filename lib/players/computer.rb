module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 0
        return "1"
      end
      if board.turn_count == 1
        if !(board.taken?(5))
          return "5"
        elsif !(board.taken?(9))
          return "9"
        elsif !(board.taken?(1))
          return "1"
        elsif !(board.taken?(3))
          return "3"
        else !(board.taken?(7))
          return "7"
        end
      end
      if board.turn_count > 1

        if self.check_board_for_win(board)
          return self.check_board_for_win(board)
        elsif self.check_board_for_opponent(board)
          return self.check_board_for_opponent(board)
        else
          if !(board.taken?(1))
            return "1"
          elsif !(board.taken?(3))
            return "3"
          elsif !(board.taken?(7))
            return "7"
          elsif !(board.taken?(9))
            return "9"
          elsif !(board.taken?(5))
            return "5"
          elsif !(board.taken?(2))
            return "2"
          elsif !(board.taken?(4))
            return "4"
          elsif !(board.taken?(6))
            return "6"
          elsif !(board.taken?(8))
            return "8"
          end
        end
      end
    end

    def check_board_for_win(board)
      Game::WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token
          return (combo[2] + 1).to_s unless board.taken?((combo[2] + 1))
        elsif board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token
          return (combo[0] + 1).to_s unless board.taken?((combo[0] + 1))
        elsif board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token
          return (combo[1] + 1).to_s unless board.taken?((combo[1] + 1))
        end
       end
       return nil
      end

      def check_board_for_opponent(board)
        if self.token == "X"
          sign = "O"
        else
          sign = "X"
        end
        Game::WIN_COMBINATIONS.each do |combo|
          if board.cells[combo[0]] == sign && board.cells[combo[1]] == sign
            return (combo[2] + 1).to_s unless board.taken?((combo[2] + 1))
          elsif board.cells[combo[1]] == sign && board.cells[combo[2]] == sign
            return (combo[0] + 1).to_s unless board.taken?((combo[0] + 1))
          elsif board.cells[combo[0]] == sign && board.cells[combo[2]] == sign
            return (combo[1] + 1).to_s unless board.taken?((combo[1] + 1))
          end
        end
        return nil
      end



  end
end
