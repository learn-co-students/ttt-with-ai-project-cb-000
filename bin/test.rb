#!/usr/bin/env ruby

require_relative '../config/environment'

def setup_and_play
  puts "Let's setup the game... how many players [0, 1, 2]?"
  num_players = gets.chomp
  while num_players.match(/[\A[012]\z]/) == nil
    puts "Incorrect input."
    puts "Let's setup the game... how many players [0, 1, 2]?"
    num_players = gets.chomp
  end
  
  puts "Who should go first and be 'X'? Player 1 or Player 2? [1,2]"
  who_first = gets.chomp
  while who_first.match(/[\A[1,2]\z]/) == nil
    puts "Incorrect input."
    puts "Who should go first and be 'X'? Player 1 or Player 2? If 1-player game, Player 1 is Human. [1,2]"
    who_first = gets.chomp
  end
  
  first_player_token = "X"
  second_player_token = "O"
  if(who_first == "2")
    first_player_token = "O"
    second_player_token = "X"
  end
      
  case num_players
  when "0"
    game = Game.new(Players::Computer.new(first_player_token), Players::Computer.new(second_player_token))
  when "1"
    game = Game.new(Players::Human.new(first_player_token), Players::Computer.new(second_player_token))
  when "2"
    game = Game.new(Players::Human.new(first_player_token), Players::Human.new(second_player_token))
  end
  
  game.play 
end

def check_play_again
  puts "Would you like to play again? [y/n]"
  play_again = gets.chomp
  while play_again.match(/[ynYn]/) == nil
    puts "Incorrect input."
    puts "Would you like to play again? [y/n]"
    play_again = gets.chomp
  end
  
  if(play_again.match(/[yY]/) != nil)
    setup_and_play
    check_play_again
  end
end

# Tests of algortithm from https://stackoverflow.com/questions/125557/what-algorithm-for-a-tic-tac-toe-game-can-i-use-to-determine-the-best-move-for

def check_win_test
  test_board = Board.new
  test_board.set_cells(["O", " ", " ", " ", "O", " ", " ", " "," "])
  game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), test_board)
  game.play
end

def check_block_test
  test_board = Board.new
  test_board.set_cells(["X", " ", " ", " ", "X", " ", " ", " "," "])
  game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), test_board)
  game.play
end

puts "Welcome to Tic Tac Toe"
# setup_and_play
check_win_test
# check_block_test

