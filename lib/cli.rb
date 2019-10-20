
def start_game(player1, player2)
	input = nil
	loop do
		print "Enter token for player 1 (X/O): "
		input = gets.chomp.upcase
		break if input=="X"||input =="O"
	end
	game = Game.new(player1.new(input), player2.new(input=="X"? "O" : "X"), Board.new)
	game.play
end

def run_ai_test(times=100)
	game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)

	x_win=0
	o_win = 0
	tie=0
	print "Testing..."
	percent = 0
	last_percent = -1
	times.times do |i|
		percent = (i/times.to_f*100).floor
		print "\rTesting... #{percent}%" if percent!=last_percent
		last_percent=percent
		game.play(false)
		case game.winner
		when "X"
			x_win += 1
		when "O"
			o_win += 1
		when nil
			tie += 1
		end
		game.reset!
	end
	puts "\rX Wins: #{x_win}, O Wins: #{o_win}, Ties: #{tie}"
end
