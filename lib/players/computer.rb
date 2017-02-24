module Players
  class Computer < Human
    
    def move(board)
      choice = nil

      if board.valid_move?("5")
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

  end
end