module Players
  class Computer < Player

    def move(board)
      @board = board
      @win_combos = Game::WIN_COMBINATIONS
      @opponent = self.token == "X" ? "O" : "X"
      #puts "Thinking..."
      #sleep 2
      make_move
    end


    def make_move
      case
        when !@board.taken?(5)
          5
        when !@board.taken?(1)
          1
        when !@board.taken?(3)
          3
        when !@board.taken?(7)
          7
        when !@board.taken?(9)
          9
        when !@board.taken?(0)
          0
        when !@board.taken?(4)
          4
        when !@board.taken?(8)
          8
        when !@board.taken?(2)
          2
        when !@board.taken?(6)
          6
      end
    end

  end

end
