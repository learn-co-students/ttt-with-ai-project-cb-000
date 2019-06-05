module Players
  class Computer < Player
    attr_reader :board
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

    def move(board)
      @board = board

      player_token

      if check_for_winning_move != nil
        number = check_for_winning_move
      elsif block_player != nil
        number = block_player
      else
        number = open_space
      end
      number += 1
      return number.to_s #is returning the non-indexed number
    end


    def check_for_winning_move
      winning_move = nil
      WIN_COMBINATIONS.find do |win_combo|
        position_1 = board.cells[win_combo[0]]
        position_2 = board.cells[win_combo[1]]
        position_3 = board.cells[win_combo[2]]

        if (position_1 == self.token && position_2 == self.token && position_3 == " ")
          winning_move = win_combo[2]
        elsif (position_1 == self.token && position_2 == " " && position_3 == self.token)
          winning_move = win_combo[1]
        elsif (position_1 == " " && position_2 == self.token && position_3 == self.token)
          winning_move = win_combo[0]
        end
      end
      winning_move
    end

    def block_player
      block = nil
      WIN_COMBINATIONS.detect do |win_combo|
        position_1 = board.cells[win_combo[0]]
        position_2 = board.cells[win_combo[1]]
        position_3 = board.cells[win_combo[2]]

        if (position_1 == player_token && position_2 == player_token && position_3 == " ")
          block = win_combo[2]
        elsif (position_1 == player_token && position_2 == " " && position_3 == player_token)
          block = win_combo[1]
        elsif (position_1 == " " && position_2 == player_token && position_3 == player_token)
          block = win_combo[0]
        end
      end
      block
    end

    def player_token
      if self.token == "X"
        player_token = "O"
      else
        player_token = "X"
      end
    end

    def open_space
      corner_spaces = [0, 2, 6, 8]
      corner_move = corner_spaces.detect {|i| board.cells[i] == " "}
      if board.cells[4] == " "
        return 4
      elsif corner_move
        return corner_move
      else
        empty_space = []
        board.cells.each_with_index do |space, index|
          if space == " "
            empty_space << index
          end
        end
        return empty_space
      end
    end
  end
end