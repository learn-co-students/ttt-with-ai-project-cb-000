class UI

	def run
		# splash
		# greeting
		# instructions
		# select mode
		# | player vs player
		#  -----
		#       | launch Game.new play loop
		# | player vs computer
		#  ----- ask if player wants to go first ('X') or second ('O')
		#       | launch Game.new play loop
		# | computer vs computer
		#  ----- launch Game.new play loop
	end

	def splash
		splash = File.open('./lib/assets/splash.md').read
		splash.gsub!("\t", '  ').each_line { |line| puts line }
		return nil
	end


end