require_relative '../player'

module Players
  class Computer < Player
    def move(board)
      begin
        position = 1 + Random.rand(9)
      end until board.valid_move?(position)
      puts ">> Computer chose: #{position.to_s}"
      return position.to_s
    end
  end
end
