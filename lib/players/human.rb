
module Players

    class Human < Player

        attr_reader :token

        def initialize(token)
            @token = token
        end

        def move(board)
            user_input = gets
            user_input
        end
    end

    class Computer < Player

        attr_accessor :move

        def move(board)
            move = board.cells.index(" ") + 1
            move.to_s
        end

    end
end
