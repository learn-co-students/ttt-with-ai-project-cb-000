
require_relative 'board'
require_relative 'game'
require_relative 'player'
require_relative 'players/computer'
require_relative 'players/human'


p1 = Players::Computer.new("X")
p2 = Players::Computer.new("O")




x_wins = 0
o_wins = 0
draws = 0
10000.times do
  game = Game.new(p1,p2)
  result = game.play
  if result == 'Congratulations X!'
    x_wins +=1
  elsif result == 'Congratulations O!'
    o_wins +=1
  else
    draws +=1
  end
end

puts x_wins
puts o_wins
puts draws
