class Players
  class Computer < Player
    def move(board)
      board = board.cells if board.class != Array
      indexes = []
      board.each_with_index do |cell, i|
        indexes << (i + 1).to_s if cell == " "
      end
      rand_i = indexes.sample
      board[rand_i.to_i - 1] = self.token
      sleep(2.5)
      puts rand_i
      rand_i
    end
  end
end
