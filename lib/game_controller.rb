class GameController

  def call
    input = ''
    while input != 'exit'
      puts 'Welcome to TicTacToe'
      puts 'Play against the computer or a friend'
      puts "For a game demo, computer plays against itself, enter '0'"
      puts "For a 1 Player game, and play the computer, enter '1'"
      puts "For a 2 Player game, and play a friend, enter '2'"
      puts "To quit, type 'exit' or 'e'"
      puts 'What would you like to do?'
      input = gets.chomp

      case input
      when '0'
        self.demo
      when '1'
        self.one_player
      when '2'
        self.two_player
      when 'exit', 'e', 'quit', 'q'
        input = 'exit'
      end
    end
  end

  def one_player
    start = go_first?
    player = pick_player

    if (start && player)
      player_1 = Players::Human.new('X')
      player_2 = Players::Computer.new('O')
    elsif start && !player
      player_1 = Players::Human.new('O')
      player_2 = Players::Computer.new('X')
    elsif !start && player
      player_1 = Players::Computer.new('O')
      player_2 = Players::Human.new('X')
    else
      player_1 = Players::Computer.new('X')
      player_2 = Players::Human.new('O')
    end
    # launch the Game
    Game.new(player_1, player_2).play
  end

  def two_player
    # TODO
    puts 'Two player Game'
  end

  def demo
    # TODO
    puts 'Demo Game!'
  end

  private
  def go_first?
    puts "Would you like to go first, enter 'yes' or 'no'"
    input = gets.chomp.downcase
    input == 'yes' || input == 'y'
  end

  def pick_player
    puts "Would you like to be player 'X', enter 'yes' or 'no'"
    input = gets.chomp.downcase
    input == 'yes' || input == 'y'
  end

end
