module Players

  class Computer < Player
    attr_reader :token, :name

    def initialize(token, name="Computer Player")
      @token = token
      @name = name
    end

    def move(board)
      if board.cells.all?{|x| x==" "}
        return "5"
      elsif board.turn_count.between?(2,5)
        corner = ["1","3","7","9"]
        a = ""
        a = corner.detect do |x|
          board.valid_move?(x)
        end
        return a
      else
        box = ["2", "4", "6","8"]
        a = ""
        a = box.detect do |x|
          board.valid_move?(x)
        end
      end
    end

  end

end
