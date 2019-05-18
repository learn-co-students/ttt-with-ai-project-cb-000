require "pry"
module Players

  class Computer < Player



    @@combos = {
      1 => [[2,3],[5,9],[4,7]],
      2 => [[1,3],[5,8]],
      3 => [[1,2],[6,9],[5,7]],
      4 => [[5,6],[1,7]],
      5 => [[1,9],[2,8],[3,7],[4,6]],
      6 => [[4,5],[3,9]],
      7 => [[1,4],[3,5],[8,9]],
      8 => [[2,5],[7,9]],
      9 => [[1,5],[3,6],[7,8]]
    }

    def move(board)
      valid_moves = (1..9).map {|place| place if board.valid_move?(place)}

      if board.turn_count == 0 #played first - first move
        return [1,3,7,9,5].sample.to_s #picks a corner or center
      end

      if board.turn_count == 1 #played second - first move
        if !valid_moves.include?(5) #opponent picked center
          return [1,3,7,9].sample.to_s #picks a corner
        else
          return "5" #picks center
        end
      end

      if board.turn_count == 2 #played first - second move
        if !valid_moves.include?(5) #opponent picked center
          #play kitty-corner from original move
          if !valid_moves.include?(1)
            return "9"
          elsif !valid_moves.include?(3)
             return "7"
          elsif !valid_moves.include?(7)
            return "3"
          else
            return "1"
          end
        elsif valid_moves.count {|x| x.odd?} == 3 # opponent has taken corner
          #play open corner
          if valid_moves.include?(1)
            return "1"
          elsif valid_moves.include?(3)
             return "3"
          elsif valid_moves.include?(7)
            return "7"
          elsif valid_moves.include?(9)
            return "9"
          end
        else
          return "5" if valid_moves.include?(5) #picks center
        end
      end


      if board.turn_count == 3 #played second - second move

        #1 - check for block from player 1
        return win_or_block(valid_moves,board) if win_or_block(valid_moves,board)

        #2 - check for corner & edge
        if board.position(1) == opponent && (board.position(6) == opponent || board.position(8) == opponent)
          return "9" if valid_moves.include?(9)
        elsif board.position(3) == opponent && (board.position(4) == opponent || board.position(8) == opponent)
          return "7" if valid_moves.include?(7)
        elsif board.position(7) == opponent && (board.position(2) == opponent || board.position(6) == opponent)
          return "3" if valid_moves.include?(3)
        elsif board.position(9) == opponent && (board.position(2) == opponent || board.position(4) == opponent)
          return "1" if valid_moves.include?(1)
        end

        #3 - 2 edges
        if board.position(2) == opponent && board.position(4) == opponent
          return "1" if valid_moves.include?(1)
        elsif board.position(2) == opponent && board.position(6) == opponent
          return "3" if valid_moves.include?(3)
        elsif board.position(4) == opponent && board.position(8) == opponent
          return "7" if valid_moves.include?(7)
        elsif board.position(6) == opponent && board.position(8) == opponent
          return "9" if valid_moves.include?(9)
        end

        #4 kitty-corners
        if board.position(1) == opponent && board.position(9) == opponent
          return [2,4,6,8].sample.to_s
        elsif board.position(3) == opponent && board.position(7) == opponent
          return [2,4,6,8].sample.to_s
        end
      end

      #win or block
      return win_or_block(valid_moves,board) if win_or_block(valid_moves,board)

      (valid_moves.sample).to_s #picks a random move out of remaining possibilities

    end #end move

    def opponent
      self.token == "X" ? "O" : "X"
    end

    def win_or_block(valid_moves,board)
      @@combos.each do |key,pairs|
        pairs.each do|pair|
          if board.cells[pair[0]-1] == self.token && board.cells[pair[1]-1] == self.token && valid_moves.include?(key)
            return key.to_s
          elsif board.cells[pair[0]-1] == opponent && board.cells[pair[1]-1] == opponent && valid_moves.include?(key)
            return key.to_s
          end
        end
      end
      nil
    end

  end

end
