module Players
  class Human < Player

    def move(token)
      puts "Player \"#{token}\", please enter the spot you would like to mark:"
      input = gets.chomp
    end
  end
end