module Players
  class Computer < Player
    def move(board)
      move = nil

      #Try and place move in middle if first player
      if !board.taken?(5)
        move = "5"
      #Move top left if middle taken and second player
      elsif board.turn_count == 1
        move = "1"
      # Take corner square if not taken and placed move in middle
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      # Block win attempt
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"
      # Check for possible win combinations on board
      else
        Game::WIN_COMBINATIONS.detect { |x|
          # Check if any possible win combinations for self
          if x.select{ |i| board.position(i+1) == token}.size == 2 && x.any?{|i| board.position(i+1) == " " }
            move = x.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          # If no win combinations block opponent
          elsif x.select{ |i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && x.any?{|i| board.position(i+1) == " " }
            move = x.select{ |i| !board.taken?(i+1 )}.first.to_i.+(1).to_s
          end
        }
        # Play in open square if no win combinations present on board
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end

      move
    end
  end
end
