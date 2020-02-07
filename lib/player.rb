class Player
    attr_reader :token

  def initialize(token)
    @token = token
  end


end

module Players
  class Human < Player
    def move(gameBoard)
      place = gets.strip
    end
  end

  class Computer < Player
    def move(board)
      if board.valid_move?("5")
        "5"
      elsif board.valid_move?("1")
        "1"
      elsif board.valid_move?("3")
        "3"
      elsif board.valid_move?("7")
        "7"
      elsif board.valid_move?("6")
        "6"
      elsif board.valid_move?("9")
        "9"
      elsif board.valid_move?("4")
        "4"
      elsif board.valid_move?("2")
        "2"
      else
        "8"
      end
    end
  end
end
