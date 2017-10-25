module Players
    class Human < Player
        def move(board)
            if board.turn_count.odd?
                puts "\nPlayer two: please enter 1-9:"
            else
                puts "\nPlayer one: please enter 1-9:"
            end
            print "> "
            gets.strip
        end
    end
end