module Players
  class Human < Player
    def move(board)
      puts 'Enter a cell to take: '
      cell = gets.chomp
      cell
    end
  end
end
