module Players
  class Computer < Player

    def move(board)
      # decide on some strategy depending on starting own starting position (am I first or second player)
      # see https://www.quora.com/Is-there-a-way-to-never-lose-at-Tic-Tac-Toe
      move = nil
      # take the middle if starting, if second take it if still free

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1 # player is second
        move = "7"
      elsif board.turn_count ==
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      else
        valid_moves = []
        (1..9).each do |pos|
          valid_moves << "#{pos}" if board.valid_move?(pos)
        end
        pick = Random.rand(0...valid_moves.length)
        valid_moves[pick]
      end
    end
  end
end