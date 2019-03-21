class Game
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
  ]


  attr_accessor :board, :player_1, :player_2, :gamesWon, :gamesCat, :winHistory

  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
     @player_1 = player1
     @player_2 = player2
     @board = board
     @gamesWon = 0
     @gamesCat = 0
     @winHistory = []
  end

  def over?
      draw? || won? ? true : false
  end

  def draw?
      @board.full? && !won? ? true : false
  end

  def won?
      #returns ONLY whether there is a winning
      #pattern - returns which pattern won  
      retVal = false
      WIN_COMBINATIONS.each do |x|
        if
          (@board.cells[x[0]] == "X" &&
           @board.cells[x[1]] == "X" &&
           @board.cells[x[2]] == "X") ||
           (@board.cells[x[0]] == "O" &&
            @board.cells[x[1]] == "O" &&
            @board.cells[x[2]] == "O")
            retVal = [x[0], x[1], x[2]]
        end
      end
      retVal
  end

  def winner
      winningRow = won?
     
      if (winningRow)
          @board.cells[winningRow[0]] == "X" ? "X" : "O"
      else
          nil
      end
  end

  def play
      #entry point for game
      tempHistory = []
      
      while !over?
          turn
         tempHistory << @board.cells.dup
        end

        if won?
          @gamesWon += 1
          @winHistory << tempHistory.dup
          puts "Congratulations #{winner}!"
        elsif draw?
          @gamesCat += 1
          puts "Cat's Game!"
        end

        #@board.reset!

  end

  def printWinHistory
      puts("Win History:  \n")
      puts("=================")
      for i in 0 .. @winHistory.size - 1 do
          puts("Game #{i + 1}")
          puts("=========================================")

          for j in  0 .. @winHistory[i].size - 1 do
              @board.display(@winHistory[i][j])
             #puts("#{@winHistory[i][j]}\n\n")
          end
          puts("=========================================")
      end
  end

 def turn
      player = current_player
      #puts("Current player:  #{player.token}")
      movePos = current_player.move(@board)
      puts("Current player #{player.token} moving to:  #{movePos}")
      if !@board.valid_move?(movePos)
        turn
      else
        @board.update(movePos, player)
      #puts("Board contents:  \n#{@board.cells}")
      end
      @board.display
  end


  def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
end #Game
