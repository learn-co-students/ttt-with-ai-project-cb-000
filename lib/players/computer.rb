module Players
  class Computer < Player

    def move(board)

      chosen = 0
      for i in 1..9
        pos = i.to_s
        if board.valid_move?(pos)
          chosen = i
          break
        end
      end
      chosen.to_s


    end

  end
end
