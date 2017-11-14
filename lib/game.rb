class Game
  attr_accessor :board, :player_1, :player_2, :win_combination

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],
                      [1,4,7], [2,5,8], [0,4,8], [6,4,2]]


  def self.win_combinations_exporter
    WIN_COMBINATIONS
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @win_combination = nil
  end


  def current_player
    board_state = board.cells.count(" ")
    #binding.pry
    board_state.odd? || board_state == 0 ? @player_1 : @player_2
  end

  def full?
    @board.cells.include?(" ") ? false : true
  end

  def over?
    #binding.pry
    won? || draw? || full?
  end

  def draw?
     !won? && full?
  end

  def won?
    board_array = []
    #binding.pry
    is_the_game_won = false
    WIN_COMBINATIONS.each do |win_combo|
      board_array = [ @board.cells[win_combo[0]], @board.cells[win_combo[1]], @board.cells[win_combo[2]] ]
        if board_array.all?{|entry| entry == "X"}
          @player_1.winner = true
          is_the_game_won = true
          @win_combination = [win_combo[0], win_combo[1], win_combo[2]]
        elsif board_array.all?{|entry| entry == "O"}
          @player_2.winner = true
          is_the_game_won = true
          @win_combination = [win_combo[0], win_combo[1], win_combo[2]]
        end
    end
    #binding.pry
    if is_the_game_won == true
      return true, @win_combination
    else false
    end
  end

  def winner
    won?
      if @player_1.winner == true
        return "X"
      elsif @player_2.winner == true
        return "O"
      else
        nil
    end
  end

  def turn
      @board.display
      moving_player = " "
      valid = " "
      move = " "
      moving_player = current_player
      #binding.pry
      until valid == true
        #puts "Please enter a valid number."
        move = moving_player.move(@board)
        valid = @board.valid_move?(move)
        if valid == false
          puts "Please enter a valid number!"
        end
      end
      @board.update(move, moving_player)
      @board.display
  end

  def play
    while !over?
      turn
    end
    if @player_1.winner == true
      puts "Congratulations #{@player_1.token}!"
      return @player_1
    elsif @player_2.winner == true
      puts "Congratulations #{@player_2.token}!"
      return @player_2
    end
    if draw?
      puts "Cat's Game!"
      return "Draw"
    end
  end

  def start
  end_game = false
  result_of_game = nil
    while end_game == false
      puts "Welcome To TicTacToe!"
      puts "What kind of game do you want to play?"
      puts "For 0 player game, enter '0'"
      puts "For 1 player game, enter '1'"
      puts "For 2 player game, enter '2'"
      game_type = gets.chomp
      if game_type != "0"
        puts "Who wants to go first and be 'X'"
        puts "For player 1, enter '1'"
        puts "For player 2, enter '2'"
        going_first = gets.chomp
        if going_first == "end"
          abort
        end
      end
      if game_type == '0'
        computers_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        @board.display
        result_of_game = computers_game.play
      elsif game_type == "1"
        #binding.pry
        player1_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        @board.display
        result_of_game = player1_game.play
      elsif game_type == "2"
        player2_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        result_of_game = player2_game.play
        #binding.pry
      end
      if result_of_game != nil
        puts "Would you like to play again?"
        puts "If Yes, enter 'Y'"
        puts "If No, enter 'N'"
        input_after_game = gets.chomp
        if input_after_game == 'N'
          abort("Goodbye")
        else
        end
      end
    end
  end
end
