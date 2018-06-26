

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.cells.count {|i| i == " "} % 2 == 1
      return self.player_1
    else
      return self.player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    var = WIN_COMBINATIONS.detect do |i|
      self.board.cells[i[0]] == self.board.cells[i[1]] && self.board.cells[i[1]] == self.board.cells[i[2]] && self.board.cells[i[0]] != " "
    end
  end

  def draw?
    if !won? && self.board.full?
      return true
    else
      return false
    end
  end

  def winner
    if !won? || won? == nil
      return nil
    else
      self.board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
     current_move = player.move(@board)
     if !@board.valid_move?(current_move)
       turn
     else
       puts "Turn: #{@board.turn_count+1}\n"
       @board.display
       @board.update(current_move, player)
       puts "#{player.token} moved #{current_move}"
       @board.display
       puts "\n\n"
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
