class Game
  attr_accessor :board, :player_1, :player_2, :current_player_turn

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player_turn = 1
  end

  def current_player
    countX = 0
    countO = 0
    self.board.cells.each do |cell|
      countX += 1 if cell == "X"
      countO += 1 if cell == "O"
    end
    return @player_1 if countX == countO
    return @player_2 if countX > countO
    return nil
  end

  def won_game?
    WIN_COMBINATIONS.each do |win|
      return true if self.board.cells[win[0]] == "X" && self.board.cells[win[1]] == "X" && self.board.cells[win[2]] == "X"
    end
    WIN_COMBINATIONS.each do |win|
      return true if self.board.cells[win[0]] == "O" && self.board.cells[win[1]] == "O" && self.board.cells[win[2]] == "O"
    end
    return false
  end

  def over?
    return true if self.won_game?
    self.board.cells.each do |cell|
      return false if cell == " "
    end
    return true
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      return win if self.board.cells[win[0]] == "X" && self.board.cells[win[1]] == "X" && self.board.cells[win[2]] == "X"
    end
    WIN_COMBINATIONS.each do |win|
      return win if self.board.cells[win[0]] == "O" && self.board.cells[win[1]] == "O" && self.board.cells[win[2]] == "O"
    end
    return false
  end

  def draw?
    return false if self.won_game?
    return self.over?
  end

  def winner
    winner = self.won?
    if winner == false
      return nil
    else
      return self.board.cells[winner[0]]
    end
  end

  def turn
    input = -1
    case current_player_turn
    when 1
      input = self.player_1.move(self.board)
      until self.board.valid_move?(input)
        input = self.player_1.move(self.board)
      end
      self.board.update(input, @player_1)
      @current_player_turn = 2
    when 2
      input = self.player_2.move(self.board)
      until self.board.valid_move?(input)
        input = self.player_2.move(self.board)
      end
      self.board.update(input, @player_2)
      @current_player_turn = 1
    end
  end

  def play
    until self.won? != false || self.draw?
      self.turn
    end
    winner == self.winner
    if winner == nil
      puts "Cat's Game!"
      sleep(1)
    else
      puts "Congratulations #{winner}!"
      sleep(1)
    end
  end

end
