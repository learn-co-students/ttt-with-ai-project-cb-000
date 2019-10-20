module Players
  class Human < Player
    def move(token)
      puts "Player #{token}, Which position would you like to mark?"
      gets.chomp
    end
  end
end
