
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), b = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = b
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    plays = []
    self.board.cells.each do |cell|
      if cell != " "
        plays << cell
      end
    end
    if plays.length.even?
      return player_1
    else
      return player_2
    end
  end

  def full?
    unless self.board.cells.include?(" ")
      return true
    end
  end

  def won?
    WIN_COMBINATIONS.each do |wincombo|
      win1 = wincombo[0]
      win2 = wincombo[1]
      win3 = wincombo[2]

      pos1 = self.board.cells[win1]
      pos2 = self.board.cells[win2]
      pos3 = self.board.cells[win3]

      if pos1 == "X" && pos2 == "X" && pos3 == "X"
        xwin = true
      elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
        owin = true
      else
        xwin = false
        owin = false
      end
      if xwin == true || owin == true
        return wincombo
      end
    end
    if self.full? != true
      return false
    end
  end

  def draw?
    if self.won? || self.full? != true
      return false
    else
      return true
    end
  end

  def over?
    if self.won? || self.draw? || self.full?
      return true
    else
      return false
    end
  end

  def winner
    if self.won? != false
      winner = self.won?
      return self.board.cells[winner[0]]
    else
      return nil
    end
  end

  def turn
    player = self.current_player
    go = player.move(board)
    if board.valid_move?(go)
      board.update(go, player)
      self.board.display
    else
      puts "Position Taken"
      self.turn
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end
