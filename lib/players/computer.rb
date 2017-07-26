module Players

  class Computer < Player

    def move(board)
      "#{Random.new.rand(9) + 1}"
    end
  end

end
