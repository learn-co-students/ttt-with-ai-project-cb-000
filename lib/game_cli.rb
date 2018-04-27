class GameCLI

def start
  input = ""
  while input != "q"
    puts "Welcome to Tic Tac Toe!"
    puts "Enter \'0\' to spectate 2 computer players"
    puts "Enter \'1\' to play against the computer"
    puts "Enter \'2\' to play with a friend"
    puts "Enter \'q\' to quit"
    case input
    when "0"
      spectate
    when "1"
      one_player
    when "2"
      two_player
    end
  end
end

def spectate
  token = pick_token
  if token == "X"
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")
  else
    player_1 = Players::Computer.new("O")
    player_2 = Players::Computer.new("X")
  end
  Game.new(player_1, player_2).play
end

def one_player
  token = pick_token
  if token == "X"
    player_1 = Players::Human.new("X")
    player_2 = Players::Computer.new("O")
  else
    player_1 = Players::Human.new("O")
    player_2 = Players::Computer.new("X")
  end
  Game.new(player_1, player_2).play
end

def two_player
  if token == "X"
    player_1 = Players::Human.new("X")
    player_2 = Players::Human.new("O")
  else
    player_1 = Players::Human.new("O")
    player_2 = Players::Human.new("X")
  end
  Game.new(player_1, player_2).play
end

def pick_token
  ["X", "O"].sample
end

end
