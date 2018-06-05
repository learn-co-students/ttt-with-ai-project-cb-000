module Players
  class Computer < Player
  #WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    def move(board)
      @board = board
      @nerp = Game::WIN_COMBINATIONS
      @pattern = @nerp.shuffle
      #puts "Thinking..."
      #sleep 2
      @opponent = self.token == 'X' ? 'O' : 'X'
      make_move = nil

      if move_option
        make_move = move_option
      elsif move_option_2
        make_move = move_option_2
      elsif move_option_22
        make_move = move_option_22
      elsif move_option_3
        make_move = move_option_3
      end
      puts make_move
      make_move
    end


    def move_option
      result = nil
      @pattern.shuffle.detect do |combo|
        if @board.cells[combo[0]] == @opponent && @board.cells[combo[1]] == @opponent && !@board.taken?(combo[2]+1)
          result = combo[2]+1
        elsif @board.cells[combo[1]] == @opponent && @board.cells[combo[2]] == @opponent && !@board.taken?(combo[0]+1)
          result = combo[0]+1
        elsif @board.cells[combo[0]] == @opponent && @board.cells[combo[2]] == @opponent && !@board.taken?(combo[1]+1)
          result = combo[1]+1
        end
      end
      result
    end

    def move_option_2
      result = nil
      @pattern.detect do |combo|
        if @board.cells[combo[0]] == self.token && @board.cells[combo[1]] == self.token && !@board.taken?(combo[2]+1)
          result = combo[2]+1
        elsif @board.cells[combo[1]] == self.token && @board.cells[combo[2]] == self.token && !@board.taken?(combo[0]+1)
          result = combo[0]+1
        elsif @board.cells[combo[0]] == self.token && @board.cells[combo[2]] == self.token && !@board.taken?(combo[1]+1)
          result = combo[1]+1
        end
      end
      result
    end


    def move_option_22
      result = nil
      @pattern.shuffle.detect do |combo|
        if @board.cells[combo[0]] == self.token && !@board.taken?(combo[1]+1) && !@board.taken?(combo[2]+1)
          result = combo[2]+1
        elsif @board.cells[combo[1]] == self.token && !@board.taken?(combo[0]+1) && !@board.taken?(combo[2]+1)
          result = combo[0]+1
        elsif @board.cells[combo[2]] == self.token && !@board.taken?(combo[1]+1) && !@board.taken?(combo[0]+1)
          result = combo[1]+1
        end
      end
      result
    end

    def move_option_3
      if @board.position('5') == @opponent
        [1, 3, 7, 9].shuffle.detect {|n| !@board.taken?(n)} || [2, 4, 6, 8].shuffle.detect {|n| !@board.taken?(n)}
      elsif @board.position('5') == self.token || !@board.taken?('5')
        !@board.taken?('5') ? '5' : [2, 4, 6, 8].shuffle.detect {|n| !@board.taken?(n)} || [1, 3, 7, 9].shuffle.detect {|n| !@board.taken?(n)}
      end

    end

  end
end
