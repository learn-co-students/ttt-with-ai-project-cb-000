module Players
  class Computer < Player

    def move(board)
      # AI should look at the board and check if move is valid, if move is able to win
      valid_moves = []
      (1..9).each do |pos|
        valid_moves << "#{pos}" if board.valid_move?(pos)
      end
      pick = Random.rand(0...valid_moves.length)
      valid_moves[pick]
    end

  end
end