class Game
  attr_accessor :player_1, :player_2
  attr_reader :board

  def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"), board=Board.new)
    @board=board
    @player_1 = player1
    @player_2 = player2
  end

  def board=(board)
    @board=board
  end

  def current_player
    a = @board.turn_count
    b = a % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    board = @board.cells
    if (board.all? {|i| i == "" || i ==" "})
      false
    else
      WIN_COMBINATIONS.detect do |x|
        #(board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X") || (board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O")
        (x.all?{|i| board[i] == "X"} || x.all?{|i| board[i] == "O"} )
      end
    end

  end

  def draw?
    !(self.won?) && @board.full?
  end

  def over?
    self.won? || self.draw? || @board.full?
  end

  def winner
    if won?
     a = won?
     @board.cells[a[0]]
   end
  end

  def turn
    index = self.current_player.move([])
    if @board.valid_move?(index)
      @board.update(index, self.current_player)
    else
      turn
    end

    #@board.display
  end

  def play
    while !(self.over?)
      self.turn
    end
    if self.winner
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat\'s Game!"
    end
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
end #Closes Game Class
