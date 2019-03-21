module Players
    class Human < Player
        def move(board)
            input = 0
            loop do
                print("Player '#{@token}' square [1-9]: ")
                input = gets.strip
                puts("")
                if !board.valid_move?(input)
                    puts("Selection must be between 1-9.")
                elsif board.taken?(input)
                    puts("Position taken.")
                else
                    break;
                end #if
            end #loop
            input
        end #move
    end #Human
end #Module
