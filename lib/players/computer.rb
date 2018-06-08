module Players
  class Computer < Player
    attr_accessor :matrix, :opponent
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

    def move(board)
      self.set_opponent
      self.refresh_board(board)
      puts "Computer:"
      input = board.cells.index(" ")
      if board.cells[4] == " "
        input = 4
      elsif two_of_three(self) != nil && valid?(two_of_three(self))
        # binding.pry
        input = two_of_three(self)
      elsif two_of_three(@opponent) && valid?(two_of_three(@opponent))
        puts "Blocking Move"
        input = two_of_three(@opponent)
      elsif self.valid?(self.strategy_spot)
        input = self.strategy_spot
      end


      input += 1
      input.to_s

    end

    def refresh_board(updated_board)
      @matrix = updated_board
    end

    def two_of_three(player = self)
      next_move = nil
      WIN_COMBINATIONS.each do |a , b, c |
        if player.token == @matrix.cells[a] && player.token == @matrix.cells[b] && @matrix.cells[c] == " "
          puts "if 1 #{a} #{b} #{c}"
          next_move = c
        elsif player.token == @matrix.cells[b] && player.token == @matrix.cells[c] && @matrix.cells[a] == " "
          puts "if 2 #{a} #{b} #{c}"
          next_move = a
        elsif player.token == @matrix.cells[a] && player.token == @matrix.cells[c] && @matrix.cells[b] == " "
          puts "if 3 #{a} #{b} #{c}"
          next_move = b
        end
      end
      next_move
    end

    def set_opponent
      #  @opponent = Game.player_1
      self.token == Game.player_1.token ? @opponent = Game.player_2 : @opponent = Game.player_1
    end

    def valid?(input)
      @matrix.cells[input] == " " ? true : false
    end

    def strategy_spot
      spots = [4,0,2,6,8].shuffle
      result = spots.find {|s| @matrix.cells[s] == " "  }
      result.to_i

    end










  end
end
