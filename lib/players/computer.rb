module Players
  class Computer < Player
    def move(board)
      count = 1
      checked_board = []
      board.cells.each do |b|
        if b == " "

          checked_board << count.to_s
        end
        count += 1
      end
      random = Random.new()
      checked_board[random.rand(checked_board.length)]
    end



  end
end
