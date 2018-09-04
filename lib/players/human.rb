class Players
  class Human < Player

    def move(input)
      puts "please provide input"
      input = gets.chomp
    end
  end
end
