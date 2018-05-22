class Start_TTT

def start_game
  puts "Hello Playuhs, time for Tic Tac Toe!"
  puts "Want to play 0, 1, or 2 player game?"
  choice = gets.strip
  if choice == "0"
    Game.new
  elsif choice == "1"
    Game.new
  elsif choice == "2"
    Game.new
  end
end

end
