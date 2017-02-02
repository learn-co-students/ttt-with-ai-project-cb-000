module Players
  class Computer < Player

    def move(board)
      move = nil
      # var stores move to be called at end of method
      if !board.taken?(5)
        move = "5"
      elsif
        Game::WIN_COMBINATIONS.detect do |combo|
          if (board.cells[combo[0]] + board.cells[combo[1]] +
            board.cells[combo[2]]).gsub(/\s/,"") == "OO"
              move = combo.detect do |i|
                board.cells[i].strip.empty?
              end.+(1).to_s
          end
        end
        # Searches for the win. Condenses all three indexes of a win combo and strips out other characters. If there are two OO's, it'll take the empty slot. It find the empty slot index it now knows is there using the #empty? array method.
      elsif
        Game::WIN_COMBINATIONS.detect do |combo|
          if (board.cells[combo[0]] + board.cells[combo[1]] +
            board.cells[combo[2]]).gsub(/\s/,"") == "XX"
              move = combo.detect do |i|
                board.cells[i].strip.empty?
              end.+(1).to_s
          end
        end
        # Searches for a block. It's the same functionality as above, which is run on the opponent's positions, if there's no opportunity to win.
      else
        move = board.cells.find_index{|i| i == " "}.+(1).to_s
        # If it can't win and can't block a win, this will take the first empty index. Thus, the 1st move the computer will make, if it can't get "5" is "1". 
      end
      move
    end

  end
end
