module Players

  class Computer < Player
    attr_accessor :board

    def move(board)
      @board = board
      if win_for_me
        win_for_me
      elsif win_for_them
        win_for_them
      elsif board.valid_move?("5")
        "5"
      elsif smart_move
        smart_move
      elsif block_opponent
        block_opponent
      elsif valid_random_corner
        valid_random_corner
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
      Game.new(Players::Human.new("X"), Players::Human.new("O"), board_copy)
    end

    def other_token
      self.token == "X" ? "O" : "X"
    end

    def winning_move(token)
      (1..9).detect do |number|
        game_copy.winner == token
      end
    end

    def win_for_me
      winning_move(self.token)
    end

    def win_for_them
      winning_move(other_token)
    end

    def block_opponent
      i = 0
      while i < 20 do
        spots = Game.WIN_COMBINATIONS.find_all do |array|
          array.map {|spot| board.cells[spot] == other_token}
        end

        move = spots.sample.sample + 1

        if @board.valid_move?(move)
          move
          i = 20
        else
          i += 1
        end
      end
    end

    def smart_move
      i = 0
      while i < 20 do
        spots = Game.WIN_COMBINATIONS.find_all do |array|
          array.map {|spot| board.cells[spot] == self.token}
        end

        move = spots.sample.sample + 1 if spots.length > 1

        if @board.valid_move?(move)
          move
          i = 20
        else
          i += 1
        end
      end
    end

    def valid_random_corner
      nums = [1,3,7,9].find_all { | n | @board.valid_move?(n.to_s) }
      nums ? nums.sample : false
    end

    def valid_random_number
      num = rand(1..9)
      @board.valid_move?(num.to_s) ? num : valid_random_number
    end

  end
end
