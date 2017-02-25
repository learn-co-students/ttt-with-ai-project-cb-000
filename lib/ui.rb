class UI

	attr_accessor :user_input

	def run
		greeting
		select_mode
	end

	def greeting
		clear_screen
		splash = File.open('./lib/assets/splash.md').read
		splash.gsub!("\t", '  ').each_line { |line| puts line }

		puts "\nWelcome to Tic Tac Toe!"
		puts "\nPlease select the game mode (1-4):"
		puts "\n(1) Player vs Player"
		puts "(2) Player vs Silly Computer (you will win)"
		puts "\nEnter 'q' to exit"
	end

	def select_mode # greet, instructions, mode selection
		print "\nYour selection: "
		self.user_input = gets.strip
		case self.user_input
		when 'q' then quit_game
		when '1' then game_mode_1
		when '2' then game_mode_2
		else
			puts "Invalid input! Please try again."
			select_mode
		end
	end

	def new_game(player_1=nil, player_2=nil)
		if player_1.nil? && player_2.nil?
			game = Game.new
		else
			game = Game.new(player_1, player_2, Board.new)
		end
		game.ui = self
		game.board.display
		game.play
	end

	def game_mode_1
		clear_screen
		puts "\nPlayer vs Player!"
		puts "\nPlayer 1 is X, Player 2 is O"
		puts "\nPlease select placement from 1-9"
		puts "(1 is the top left corner, 9 is bottom right)"
		puts "Good luck!"
		new_game
	end

	def game_mode_2
		clear_screen
		puts "\nPlayer vs Friendly Computer!"
		puts "\nPlayer will start as 'X', Computer is 'O'"
		puts "\nHuman, please select placement from 1-9"
		puts "(1 is the top left corner, 9 is bottom right)"
		puts "Good luck!"
		new_game(Players::Human.new('X'), Players::Computer.new('O'))
	end

	def clear_screen
		system('clear') || system('cls')
	end

	def quit_game
		puts "See you next time!"
		exit
	end

end