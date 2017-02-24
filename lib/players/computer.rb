require 'pry'

module Players
  class Computer < Human
    
    def move(board)
      choice = nil

      if self.prevent_win(board)
        choice = self.prevent_win(board)
      elsif board.valid_move?("5")
        choice = "5" #choose the middle if it's open
      else
        #choose a random number
        loop do
          choice = rand(1..9).to_s
          break if board.valid_move?(choice)
        end
      end

      puts "Computer chooses #{choice}"
      choice
    end

    def prevent_win(board)
      opponent_token = ""
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"

      line_to_block = Game::WIN_COMBINATIONS.detect do |line|
        line.count{|line_index| board.cells[line_index] == opponent_token} == 2
      end

      if line_to_block
        index = line_to_block.select {|i| board.cells[i] == " "}
        if index != []
          choice = (index[0] + 1).to_s
        end
      end
    end

  end
end