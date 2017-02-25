module Players
  class Computer < Human

    def move(board)
      position = nil

      if self.find_at_risk_square(board)
        position = self.find_at_risk_square(board)
      elsif board.valid_move?('5')
        position = '5'
      else
        unless position
          position = rand(1..9).to_s
          position = nil if !board.valid_move?(position)
        end
      end
      position
    end

    def find_at_risk_square(board)
      opponent_token = ''
      self.token == 'X' ? opponent_token = 'O' : opponent_token = 'X'

      block_choice = Game::WIN_COMBINATIONS.detect do |win_combination|
        win_combination.count { |position| board.cells[position] == opponent_token } == 2 # find a set of squares that are almost winning
      end

      if block_choice
        new_choice_index = block_choice.select { |index| board.cells[index] == ' ' } # see if space available to block a win
        if new_choice_index != []
          (new_choice_index[0] + 1).to_s # if not empty choice, convert to string and add 1 to make it easier for user
        end
      end
    end
  end
end
