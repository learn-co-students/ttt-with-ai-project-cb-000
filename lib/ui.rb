class UI

	attr_accessor :user_input

	def run
		# splash
		# greeting
		# instructions
		# select mode
		# validate input
		# | player vs player
		#  -----
		#       | launch Game.new play loop
		# | player vs computer
		#  ----- ask if player wants to go first ('X') or second ('O')
		#       | launch Game.new play loop
		# | computer vs computer
		#  ----- launch Game.new play loop
	end

	def greeting
		clear_screen
		splash = File.open('./lib/assets/splash.md').read
		splash.gsub!("\t", '  ').each_line { |line| puts line }

		puts "\nWelcome to Tic Tac Toe!"
		puts "\nPlease select the game mode (1-4):"
		puts "\n(1) Player vs Player"
		puts "(2) Player vs Friendly Computer (you may win)"
		puts "(3) Player vs Evil Computer (you will not win)"
		puts "(4) Battle of Robots! Computer vs Computer"
		puts "\nEnter 'q' to exit"
		get_input
	end

	def get_input # greet, instructions, mode selection
		print "\nYour selection: "
		self.user_input = gets.strip
		case self.user_input
		when 'q' then quit_game
		when '1' then game_mode_1
		else
			puts "Invalid input! Please try again."
			get_input
		end
	end

	def game_mode_1
		clear_screen
		puts "\nPlayer vs Player!"
		puts "\nPlayer 1 is X, Player 2 is O"
		puts "\nPlease select placement from 1-9"
		puts "(1 is the top left corner, 9 is bottom right)"
		puts "Good luck!"
		game = Game.new
		game.play
	end

	def clear_screen
		system('clear') || system('cls')
	end

	def quit_game
		puts "See you next time!"
		exit
	end

end