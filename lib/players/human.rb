
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

end
