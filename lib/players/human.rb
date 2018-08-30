class Players
  class Human < Player
    def move(board)
      puts "#{self.token}, please enter your next move:"
      gets.chomp
    end
  end

  class Computer < Player
    WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

    def move(board)
      combo_to_win = near_victory?(board, self)
      combo_to_block = near_victory?(board, self.opponent)
      if combo_to_win
        position = play_combo(board, combo_to_win)
      elsif combo_to_block
        position = play_combo(board, combo_to_block)
      else
        position = random_move(board)
      end

      position
    end

    def random_move(board)
      puts "Random computer play"
      random_number = Random.new
      position = nil
      while !board.valid_move?(position)
        position = (random_number.rand(9) + 1).to_s
      end
      position
    end

    def near_victory?(board, player)
      positions = player.find_player_positions(board)
      play_this_combo = false
      WIN_COMBINATIONS.each do |combo|
        all_taken = !combo.detect {|position| !board.taken?(position + 1)}
        play_this_combo = combo if (positions + combo).uniq.count == positions.count + 1 && !all_taken
      end

      play_this_combo
    end

    def play_combo(board, combo)
      next_move = combo.detect {|position| !board.taken?(position + 1)}
      puts "Combo to play: #{combo}"
      puts "Strategically playing #{next_move}"
      next_move + 1
    end
  end
end