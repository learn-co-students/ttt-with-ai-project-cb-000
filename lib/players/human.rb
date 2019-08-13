module Players
  class Human < Player
    def move(board)
      puts "Enter a selection: "
      play = gets
    end
  end
end
