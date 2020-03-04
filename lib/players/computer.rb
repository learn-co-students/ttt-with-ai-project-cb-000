module Players
  class Computer < Player
    def move(board)
      # Implement some strategy
      best_positions = ['5','1','3','7','9']
      position = best_positions.detect do |p|
        !board.taken?(p)
      end
      position ||= rand(1..9).to_s
    end
  end
end
