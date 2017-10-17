require_relative '../player.rb'
module Players

  class Computer < Player

    def move(board)
        computer_move = Random.new
        computer_move = computer_move.rand(1..9)
        "#{computer_move}"


    end

  end

end
