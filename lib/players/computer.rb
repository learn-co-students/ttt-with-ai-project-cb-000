module Players
  class Computer < Player

    attr_accessor :board

    def move(board)

      @board = board
      corners = [1,3,7,9]
      last_moves = [2,4,6,8]

      if !board.taken?(5)
        '5'
      elsif board.valid_move?(corners.sample)
        corners.sample
      elsif board.valid_move?(last_moves.sample)
        last_moves.sample
      end

    end
  end
end
