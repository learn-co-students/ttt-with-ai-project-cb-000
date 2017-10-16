class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2

  end


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

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    if self.board.full? || self.won? || self.draw?
      true
    else
      false
    end
  end

  def full?
     board.cells.none? { |e| e == " " }
  end

  def draw?
    if won? == false && full? == true
      true
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winindex|
      if board.cells[winindex[0]] == "X" && board.cells[winindex[1]] == "X" && board.cells[winindex[2]] == "X"
        return winindex
      elsif board.cells[winindex[0]] == "O" && board.cells[winindex[1]] == "O" && board.cells[winindex[2]] == "O"
        return winindex
      end
    end
    return false
  end

  def winner
    winindex = won?
    if winindex == false
      return nil
    elsif board.cells[winindex[0]] == "X"
      return "X"
    elsif board.cells[winindex[0]] == "O"
      return "O"
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    input = ""
    while input != "exit"
      puts "Welcome to Tic Tac Toe!"
      puts "How many players will be playing? Enter: 0, 1, or 2"
      input = gets.strip
      case input
      when "0"
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        puts "Would you like to play again? Enter: 'yes', or 'exit'"
        input = gets.strip
        if input == "yes || Yes || YES"
          self.start
        end

      when "1"
        puts "You will be player 1 and go first, as X"
        Game.new.board.display
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        puts "Would you like to play again? Enter: 'yes', or 'exit'"
        input = gets.strip
        if input == "yes || Yes || YES"
          self.start
        end

      when "2"
        puts "Decide who will go first and be X, then begin!"
        Game.new.board.display
        self.play
        puts "Would you like to play again? Enter: 'yes', or 'exit'"
        input = gets.strip
        if input == "yes || Yes || YES"
          self.start
        end
      end
    end
  end

# end of "Game" class
end
