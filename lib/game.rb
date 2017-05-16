class Game
  attr_accessor :board, :player_1, :player_2

  # Define your play method below
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)

    @board = board
    @player_1 = player_1
    @player_2 = player_2
  
    
  end

  def current_player

    counter = turn_count
    return @player_1 if counter == 0
    if (counter + 1) % 2 == 0
      @player_2
    else
      @player_1
    end

  end
  def turn_count
    self.board.turn_count
  end


  def over?
      self.board.over?
  end

  def won?
    self.board.won?
  

  end  

  def draw?
    self.board.draw?

  end  

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]


  def winner
    return self.board.won? if won? != false
    nil

  end

  def valid_move?(index)
    self.board.valid_move?(index)
  end



  def play
    until over?
       turn
      break if won? != false
      break if draw?
     
     end
     puts "Congratulations #{winner}!" if won? != false
     puts "Cat's Game!" if draw? == true
  end

  def turn
         while true
          index = current_player.move(board)
          break if valid_move?(index)
         end
        self.board.update(index, current_player)
        self.board.display

  end
end