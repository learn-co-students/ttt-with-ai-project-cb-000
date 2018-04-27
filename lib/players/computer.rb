require "pry"
module Players
  class Computer < Player
    def move(board)
       move = rand(1..9).to_s
    end
  end
end
