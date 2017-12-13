module Players

  class Computer < Player

    def move(board)
      @board = board
      if !board.taken?(5)
        5
      # elsif Game::WIN_COMBINATIONS.detect do |combo|
      #         if combo.select{|i| board.position(i) == token}.size == 2 && combo.any?{|i| board.position(i) == " "}
      #           combo.select{|i| board.valid_move?(i)}
      #         elsif combo.select{|i| board.position(i) != " " && board.position(i) != token}.size == 2 && combo.any?{|i| board.position(i) == " "}
      #           combo.select{|i| board.valid_move?(i)}
      #         end
      #       end
      else
        [5, 1, 3, 7, 9, 2, 4, 6, 8].detect {|i| i if board.valid_move?(i)}
      end
    end
  end
end
