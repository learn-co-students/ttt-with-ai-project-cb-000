class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2, :num_games

  def initialize(*arg)
    if arg.empty?
      @board = Board.new
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    else
      @player_1, @player_2, @board = arg
    end
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    self.board.full? || self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect {|c| c.all?{|x| self.board.cells[x]=="X"} || c.all?{|x| self.board.cells[x]=="O"}}
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    self.won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    player = self.current_player
    move = player.move(self.board) while !self.board.valid_move?(move)
    self.board.update(move,player)
  end

  #Call play loop when doing multiple games and until user doesn't continue
  def play
    exit = false
    count = 0

    until exit
      self.intro_message.each {|m| puts m}
      self.board.display_help

      type = self.play_type #Call method to ask for game type
      type != 4 ? self.play_loop : self.war_loop(true)

      print "[MX+MO] Another game? (Yes/no) >>"
      exit = true if catch_input.strip.downcase == "no"
    end
  end

  def play_loop
    until over?
      self.turn
      self.board.display
    end
    puts self.draw? ? "[MX+MO] It's a Cat's Game!\n\n" : "[MX+MO] Congratulations #{self.winner}!\n\n"
    self.board.reset!
  end

  def war_loop(quiet)
    puts "[MX+MO] Time for WAR !!!!!!!!!!!!!!!!!!!!!"
    board_stats, game_count = [0,0,0], 0

    while game_count < num_games
      until over?
        self.turn
        self.board.display if !quiet
      end

      if self.draw?
        board_stats[0] += 1
      else
        self.winner == "X" ? board_stats[1] += 1 : board_stats[2] += 1
      end
      game_count += 1
      self.board.reset!
    end
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "[MX+MO] War: X won #{board_stats[1]} times"
    puts "[MX+MO] War: O won #{board_stats[2]} times"
    puts "[MX+MO] War: Drawed #{board_stats[0]} times"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
  end

  def play_type
    print "[MX+MO] Please choose a game type (1-4) >>"
    type = catch_input.strip.to_i

    case type
    when 2
      @player_2 = self.computer_setup("O")

    when 3
      @player_1 = self.computer_setup("X")
      @player_2 = self.computer_setup("O")

    #Wargamish mode where computer plays itself repeatedly
    when 4
      @player_1 = self.computer_setup("X")
      @player_2 = self.computer_setup("O")
      print "[MX+MO] How many battles are there ??"
      @num_games = gets.strip.to_i
    end
    type
  end

  def computer_setup(token)
    player = Players::Computer.new(token)
    print "[MX+MO] #{player.salutation} skill level (0:easy 1:normal 2:hard)>>"
    player.skill = gets.strip.to_i
    player
  end

  def intro_message
    intro = ["~~~~~ Welcome to Mr X & Miss O (M+M) ~~~~~"]
    intro << File.read("./asset/splash")
    intro << "~~~~~       Formerly TicTacToe       ~~~~~\n\n"
    intro << "                Game Modes::"
    intro << "             1. Human vs Human"
    intro << "             2. Human vs Miss O"
    intro << "             3. Mr X vs Miss O"
    intro << "             4. Start a WAR"
  end

  #The specs for this lab are annoying as they don't pass when extra gets
  #are included. I believe this is because they don't pass any information
  #to gets. I have included this catch to hopefully solve this issue.
  def catch_input
    input = $stdin.gets
    input ? input : ""
  end

end
