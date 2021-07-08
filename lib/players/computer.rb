module Players

  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]]

      def move(board)

        player = @token
        @token == "X" ? opponent = "O" : opponent = "X"

        if board.cells[4] == " "
          x = 4
        elsif winning_move(board, player) != nil
          x = winning_move(board, player)
        elsif winning_move(board, opponent) != nil
          x = winning_move(board, opponent)
        elsif attacking_move(board, player) != nil
          x = attacking_move(board, player)
        else
          x = rand(9)
        end
        x += 1
        x.to_s
      end

      def attacking_move(board, token)
        x = WIN_COMBINATIONS.detect do |win|
              [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(" ") == 2 &&
              [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(token) == 1
            end
        if x != nil
          x.find {|index| board.cells[index] == " "}
        end
      end



      def winning_move(board, token)
        x = WIN_COMBINATIONS.detect do |win|
              [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(" ") == 1 &&
              [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(token) == 2
            end
        if x != nil
          x.find {|index| board.cells[index] == " "}
        end
      end






  end





end
