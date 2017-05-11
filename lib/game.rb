class Game
  include Players
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = nil, player_2 = nil , board = nil)
    @player_1 = player_1 == nil ? Human.new("X") : player_1
    @player_2 = player_2 == nil ? Human.new("O") : player_2
    @board = board == nil ? Board.new : board
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    play_game = true
    until play_game == false
      puts "What mode would you like to play?"
      puts "1 = Computer plays itself"
      puts "2 = You play against the computer"
      puts "3 = You play against another Human"
      answer = gets.strip
      case answer
      when "1"
        game = self.new(Computer.new("X"), Computer.new("O"))
      when "2"
        puts "How will go first?"
        puts "1 = You or 2 = Computer"
        answer = gets.strip
        if answer == "1"
          game = self.new(Human.new("X"), Computer.new("O"))
        else
          game = self.new(Computer.new("X"), Human.new("O"))
        end
      when "3"
        puts "First Player will be 'X', and Second Player will be 'O'"
        game = self.new
      end

      game.play
      puts "You like to play again? y/n"
      play_again = gets.strip
      play_game = play_again == "y" ? true : false
    end
  end

  def current_player
    cells_taken = []
    @board.cells.each { |cell| cells_taken << cell unless cell == " " }
    cells_taken.size.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    !winner.nil?
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    winner = ""
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == @player_1.token && @board.cells[combination[1]] == @player_1.token && @board.cells[combination[2]] == @player_1.token
        winner = @player_1.token
      end
      if @board.cells[combination[0]] == @player_2.token && @board.cells[combination[1]] == "O" && @board.cells[combination[2]] == "O"
        winner = @player_2.token
      end
    end
    unless winner.empty?
      return winner
    end
  end

  def turn
    next_turn = false
    until next_turn == true
      position = current_player.move(@board)
      if @board.valid_move?(position)
        token = current_player.token
        @board.update(position, current_player)
        @board.display
        next_turn = true
      else
        # Ask for input again
        puts "Opps, invalid entry, try again!"
      end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
