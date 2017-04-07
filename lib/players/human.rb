module Players

class Human < Player

  def move(token)
    puts "Where would you like to make a move?"
    position = gets.chomp
  end

end

end
