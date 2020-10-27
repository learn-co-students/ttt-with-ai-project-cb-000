class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player1 = Players::Human.new('X'), player2 = Players::Human.new('O'), board = Board.new)
      @board = board
      @player_1 = player1
      @player_2 = player2
    end

    def current_player
      board.turn_count % 2 == 0 ? player_1 : player_2
    end


  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]


  def won?
    WIN_COMBINATIONS.detect{ |win_combo| @board.cells[win_combo[0]] == @board.cells[win_combo[1]] && @board.cells[win_combo[1]] == @board.cells[win_combo[2]] && @board.cells[win_combo[0]] != " " }
  end

  def draw?
    return false if won?
    @board.cells.all? { |pos| pos != " "  }
  end

  def over?
    return true if won? || draw?
  end

  def winner
    if won?
      winning_combo = won?
      winner = @board.cells[winning_combo[0]]
      return winner
    else nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else @board.update(current_move, player)
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


end
