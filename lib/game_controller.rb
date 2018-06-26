class GameController

  def initialize()
    puts ""
    puts "**** WELCOME TO TIC TAC TOE ****"
  end

  def go!()
    begin
      self.setup
      if @game != nil
        @game.play
        puts  "Wanna play again? Just press ENTER!\n" +
              "  OR type anything else and press ENTER to exit."
        print ">> "; continue_input = gets.chomp
      end
    end until continue_input != ""

    puts "**** Thanks for playing!! Au revoir! **** "
    puts ""
  end

  def setup()
    puts ""
    puts  "  Please enter a number for one of the following play options:\n" +
          "   1. Human vs. Human (2 people take turns, using the current keyboard)\n" +
          "   2. Human vs. Computer (Just you against the machine!)\n" +
          "   3. Computer vs. Computer (This will go VERY quickly!)\n" +
          "   0. Exit the game!"
    puts ""

    valid_input = true
    begin
      puts "Please enter your choice:"
      print ">> "; user_input = gets.chomp
      case user_input
        when "0"
          @game = nil
          puts "Goodbye!"
          return
        when "1"
          player_1 = Players::Human.new("X")
          player_2 = Players::Human.new("O")
        when "2"
          puts  "OKAY!! You against the machine!\n" +
                "  Just press ENTER if you want to be 'X' and go first,\n" +
                "  OR type anything else and press ENTER to let the computer go first."
          print ">> "; player_choice = gets.chomp
          if player_choice == ""
            player_1 = Players::Human.new("X")
            player_2 = Players::Computer.new("O")
          else
            player_1 = Players::Computer.new("X")
            player_2 = Players::Human.new("O")
          end
        when "3"
          player_1 = Players::Computer.new("X")
          player_2 = Players::Computer.new("O")
      else
        valid_input = false
        puts "The choice you entered, '" + user_input + "', is not valid"
      end
    end until valid_input
    @game = Game.new(player_1, player_2)
  end
end
