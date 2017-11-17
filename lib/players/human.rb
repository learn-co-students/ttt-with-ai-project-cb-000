module Players
  class Human < Player

    def move(arr)
      # STDERR.puts "***************HUMAN.move:#{arr}"
      puts "Please enter a move from 1-9"
      user_chose = gets.strip
      # move_is = "1" if arr.length == 0
      # STDERR.puts "************Human.move.user_chose:#{user_chose}"
      user_chose
    end
  end #class
end #module
 
