module Players

  class Computer < Player
    attr_accessor :board

    def move(board)
      @board = board

      if win_for_me
        win_for_me
      elsif win_for_them
        win_for_them
      elsif board.valid_move?("7") && board.cells[0] != " " && board.cells[2] != " " && board.cells[8] != " "
        "7"
      elsif board.valid_move?("5")
        "5"
      elsif board.valid_move?("3") && board.cells[0] != other_token && board.cells[2] != other_token && board.cells[8] != other_token
        "3"
      elsif board.turn_count == 4
        valid_random_edge
      elsif next_move_toward_win_or_draw
        next_move_toward_win_or_draw
      elsif valid_random_edge
        valid_random_edge
      else
        valid_random_number
      end
    end

    def board_copy
      new_board = Board.new
      new_board.cells = @board.cells.dup
      new_board
    end

    def game_copy
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board_copy)
    end

    def other_token
      self.token == "X" ? "O" : "X"
    end

    def win_for_me
      (1..9).detect do |number|
        new_game = game_copy
        new_game.board.update(number.to_s, self)
        new_game.winner == self.token
      end
    end

    def win_for_them
      (1..9).detect do |number|
        new_game = game_copy
        current_player(new_game)
        new_game.board.update(number.to_s, opponent(new_game))
        new_game.winner == other_token
      end
    end

    def winning_move(player)
      (1..9).detect do |number|
        new_game = game_copy
        current_player(new_game)
        new_game.board.update(number.to_s, player)
        new_game.winner == player.token
      end
    end

    def current_player(new_game)
      if new_game.player_1.token == self.token
        new_game.player_1
      else
        new_game.player_2
      end
    end

    def opponent(new_game)
      if new_game.player_1.token == self.token
        new_game.player_2
      else
        new_game.player_1
      end
    end

    def next_move_toward_win_or_draw
      (1..9).detect do |move|
        new_game = game_copy
        new_game.board.update(move, self)
        player = current_player(new_game)
        i = 0
        until (new_game.winner == self.token || new_game.draw? || i == 10) do
          winning_move(player) ? new_game.board.update(player.winning_move(player), player) : new_game.board.update(valid_random_number, player)
          i += 1
        end
      end
    end

    def valid_random_corner
      nums = [1,3,7,9].find_all { | n | @board.valid_move?(n.to_s) }
      nums ? nums.sample : false
    end

    def valid_random_edge
      nums = [2,4,6,8].find_all { | n | @board.valid_move?(n.to_s) }
      nums ? nums.sample : false
    end

    def valid_random_number
      num = rand(1..9)
      @board.valid_move?(num.to_s) ? num : valid_random_number
    end

  end
end
