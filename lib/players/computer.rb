module Players

    class Computer < Player

        attr_accessor :other_token, :move

        WIN_COMBINATIONS = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [6,4,2]]


        def move(board)
            self.token == "X" ? @other_token = "O" : @other_token = "X"
            if board.cells[4] == " "
                move = "5"
            elsif board.cells[4] == @other_token && board.cells[8] == " "
                move = "9"
            else
                combo_moves = []
                WIN_COMBINATIONS.each{|combo|
                    load_combo = []
                    load_combo << board.cells[combo[0]]
                    load_combo << board.cells[combo[1]]
                    load_combo << board.cells[combo[2]]
                    combo_moves << load_combo
                }
                combo_moves.each_with_index{ |combo, index|
                    if combo.count(self.token) == 2 && combo.count(" ") == 1
                        inner_index = combo.index(" ")
                        outer_index = index
                        move = (WIN_COMBINATIONS[outer_index][inner_index] + 1).to_s
                        return move
                    end
                }
                combo_moves.each_with_index{ |combo, index|
                    if combo.count(@other_token) == 2 && combo.count(" ") == 1
                        inner_index = combo.index(" ")
                        outer_index = index
                        move = (WIN_COMBINATIONS[outer_index][inner_index] + 1).to_s
                        return move
                    end
                }
                combo_moves.each_with_index{ |combo, index|
                    if combo.count(@other_token) == 1 && combo.count(" ") == 2
                        inner_index = combo.index(" ")
                        outer_index = index
                        move = (WIN_COMBINATIONS[outer_index][inner_index] + 1).to_s
                        return move
                    end
                }
                combo_moves.each_with_index{ |combo, index|
                    if combo.count(" ") >= 1
                        inner_index = combo.index(" ")
                        outer_index = index
                        move = (WIN_COMBINATIONS[outer_index][inner_index] + 1).to_s
                        return move
                    end
                }
            end
        end

    end
end
