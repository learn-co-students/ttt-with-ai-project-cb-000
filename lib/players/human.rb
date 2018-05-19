#class Players::Human < Player
module Players
  class Human < Player
    def move(board)
      puts "\nPlayer #{self.token}: Enter a number 1-9 for an unoccupied square on the board."
      puts "(Or press Ctrl-C to quit game.)"
      input=gets.strip
      input
    end
  end
end
