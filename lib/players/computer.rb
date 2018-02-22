module Players
  class Computer < Player

    attr_accessor :token

    def move(board)
      rand(0...9).to_s
    end
  end
end
