module Players
  class Computer < Player
    def move(board)
      # Players::Computer #move returns a valid position for the computer to move
      count = 1
      checked_board = []
      board.cells.each do |b|
        if b == " "
          # return count.to_s
          checked_board << count.to_s
        end #if
        count += 1
      end
      random = Random.new()
      checked_board[random.rand(checked_board.length)]
    end #movec



  end #class
end #module
