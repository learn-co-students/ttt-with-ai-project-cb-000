module Players
  class Computer < Player

    attr_accessor :board

    def move(board)

      @board = board

      if win != nil
        play_to = win
      elsif block != nil
        play_to = block
      elsif board.cells[4] == ' '
        play_to = 5
      elsif board.taken?(1) && !board.taken?(9)
        play_to = 9
      elsif board.taken?(3) && !board.taken?(7)
        play_to = 7
      elsif board.taken?(7) && !board.taken?(3)
        play_to = 3
      elsif board.taken?(9) && !board.taken?(1)
        play_to = 1
      elsif board.cells[0] == ' '
        play_to = 1
      else
        avail = []
        board.cells.each_with_index { |x, i| avail << i+1 if x == ' ' }
        play_to = avail.sample
      end
      play_to.to_s
    end

    def win
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select { |i| @board.cells[i] == token }.size == 2 && combo.any? { |i| @board.cells[i] == ' '}
          play_to_index = combo.index(' ')
          play_to = play_to_index + 1
        end
      end
    end

    def block
      other = token == 'X' ? 'O' : 'X'
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select { |i| @board.cells[i] == other }.size == 2 && combo.any? { |i| @board.cells[i] == ' '}
          play_to_index = combo.index(' ')
          play_to = play_to_index.to_i + 1
        end
      end
    end


  end
end
