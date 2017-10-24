class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player1
    self.player_2 = player2
    board.reset!
  end

  def current_player
    board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |arr|
      result = [board.cells[arr[0]], board.cells[arr[1]], board.cells[arr[2]]]
      return arr if !result.include?(" ") && result.min == result.max
    end
    false
  end

  def draw?
    over? && won? == false
  end

  def winner
    won? ? self.board.cells[self.won?.first] : nil
  end

  def turn
    choice = current_player.move(board)
    turn if !board.valid_move?(choice)
    board.update(choice, current_player)
    choice
  end

  def play
    until won? || draw?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
