module Players

    class Computer < Player

        attr_accessor :move

        def move(board)

            if board.cells[4] == " "
                move = "5"
            else
                game.WIN_COMBINATIONS.each{|combo|
                    x = board.cells[combo[0]]
                    y = board.cells[combo[1]]
                    z = board.cells[combo[2]]

                    if 
                }
            end
        end

    end
end
