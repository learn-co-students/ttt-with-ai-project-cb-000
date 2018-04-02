module Players
    class Computer < Player

        attr_accessor :board

        WIN_COMBINATIONS = [
            # Horizontal wins
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            # Up/down wins
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            # Diagonal wins
            [0, 4, 8],
            [8, 4, 0],
            [2, 4, 6],
            [6, 4, 2]
        ]

        CORNERS = [0, 2, 6, 8]

        def move(board)
            @board = board

            case
                when win != nil
                    win.to_s
                when block != nil
                    block.to_s
                when center != nil
                    center
                when corner != nil
                    corner.to_s
                else
                    board.available_moves.sample + 1
            end
        end
        
        def switch
            token == "X" ? "O" : "X"
        end

        def win
            test = WIN_COMBINATIONS.detect do |indices|
                (board.cells[indices[0]] == token && board.cells[indices[1]] == token && board.cells[indices[2]] == " ") || (board.cells[indices[1]] == token && board.cells[indices[2]] == token && board.cells[indices[0]] == " ") || (board.cells[indices[0]] == token && board.cells[indices[2]] == token && board.cells[indices[1]] == " ")
            end
                test.detect {|i| board.cells[i] == " "} + 1 unless test == nil
        end

        def block
            test = WIN_COMBINATIONS.detect do |indices|
                (board.cells[indices[0]] == switch && board.cells[indices[1]] == switch && board.cells[indices[2]] == " ") || (board.cells[indices[1]] == switch && board.cells[indices[2]] == switch && board.cells[indices[0]] == " ") || (board.cells[indices[0]] == switch && board.cells[indices[2]] == switch && board.cells[indices[1]] == " ")
            end
                test.detect {|i| board.cells[i] == " "} + 1 unless test == nil
        end

        def center
            "5" if board.cells[4] == " "
        end

        def corner
            other = CORNERS.detect do |corner|
                board.cells[corner] == switch
            end

            if other == 0 && !board.taken?(board.cells[8])
                9 
            elsif other == 8 && !board.taken?(board.cells[0])
                1
            elsif other == 2 && !board.taken?(board.cells[6])
                7
            elsif other == 6 && !board.taken?(board.cells[2])
                3
            else
                CORNERS.detect {|corner| board.cells[corner] == " "} + 1 if CORNERS.detect {|corner| board.cells[corner] == " "}
            end
        end
    end
end