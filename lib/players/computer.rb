module Players
  class Computer < Player
    @counter = 0
    def move(board)
      @counter = counter
      @board = board
      @win_combos = Game::WIN_COMBINATIONS
      @opponent = self.token == "X" ? "O" : "X"
      puts "Thinking..."
      sleep 2
=begin
      if counter <= 1
        if @board.cells[4] != " "
          5
        else
          1 if

      end
      counter =+ 1
=end
      make_move
    end
=begin
    def make_move
      move = nil
      @win_combos.find do |combo|
        if @board.cells[combo[0]] != " " && @board.cells[combo[1]] != " " && !@board.taken?(combo[2]+1)
          move = @board.taken?(combo[2]+1)
        end
      end
      move
    end


=end







=begin
     def whats_left
      @board.cells.each do |cell|
        if cell
          self.remaining << cell
        end

    end
=end
=begin
    def make_move
      result = nil
      @win_combos.each do |array|
        array.find do |combo|
          if @board.cells[array[0]] == combo
          result = !@board.taken?(0..8)
        else
          result = !@board.taken?(0..8)
        end
      end
      end
      result

    end
=end
=begin
    def make_move
        move = nil
      if !@board.taken?(5)
        5
      else

        @win_combos.each do |array|
          array.find do |combo|

          if @board.cells[combo[0]] != " " &&  @board.cells[combo[1]] != " " && !@board.taken?(combo[2])
            move = combo[2]
          elsif  @board.cells[combo[1]] != " " &&  @board.cells[combo[2]] != " " && !@board.taken?(combo[0])
            move = combo[0]
          elsif  @board.cells[combo[0]] != " " &&  @board.cells[combo[2]] != " " && !@board.taken?(combo[1])
            move = combo[1]
          end
          end
          move
        end
      end
    end
=end

=begin
    def make_move
      case
        when !@board.taken?(5)
          5
        when !@board.taken?(1)
          1
        when !@board.taken?(3)
          3
        when !@board.taken?(7)
          7
        when !@board.taken?(9)
          9
        when !@board.taken?(0)
          0
        when !@board.taken?(4)
          4
        when !@board.taken?(8)
          8
        when !@board.taken?(2)
          2
        when !@board.taken?(6)
          6
      end
    end
=end
  end

end
