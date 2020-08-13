module Players

    class Computer < Player
    
        attr_accessor :board, :token

        WIN_COMBINATIONS = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [6,4,2]
          ]

        TWO = ["#{@token} #{@token}"," #{@token}#{@token}","#{@token}#{@token} "]

        
        def move(board)
            var = rand(1..9)
            until board.valid_move?(var)
            var = rand(1..0)
          end 
          return var.to_s 
          end
        end
       
    end