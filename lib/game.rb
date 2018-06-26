class Game
  attr_accessor :board, :player_1, :player_2

  def initialize (
      player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player()
    return (self.board.turn_count % 2 == 0) ? self.player_1 : self.player_2
  end

  def over?()
    return won?() || draw?()
  end

  def won?()
    return (self.winner != nil)
  end

  def winner()
    winning_indices =  WIN_COMBINATIONS.detect{ |win_combo|
      self.board.taken?(win_combo[0] + 1) &&
      self.board.position(win_combo[0] + 1) == self.board.position(win_combo[1] + 1) &&
      self.board.position(win_combo[0] + 1) == self.board.position(win_combo[2] + 1)
    }
    return (winning_indices == nil) ? nil : self.board.position(winning_indices[0] + 1)
  end

  def draw?()
    return !won?() && self.board.full?()
  end

  def turn()
    begin
      player_input = self.current_player.move(self.board)
      valid_position = self.board.valid_move?(player_input)
      if !valid_position
        puts("Sorry, '#{player_input}' is not valid!")
      end
    end until valid_position
    self.board.update(player_input, self.current_player)
  end

  def play()
    puts "========= THE GAME IS AFOOT =========="
    self.board.display
    puts ">>>> 'X' always goes first! GOOD LUCK!!"
    while !self.over?
      self.turn
      self.board.display
      if !self.over?
        puts ">>>> Next turn belongs to: " + self.current_player.token +
              " (" + self.current_player.subclass_to_s + ")"
      end
    end
    if self.won?
      puts "WE HAVE A WINNER!  Congratulations #{self.winner}!!"
    else
      puts "Cat's Game! (It's a draw.)"
    end
    puts ""
  end

  WIN_COMBINATIONS = [
    # row wins
    [0,1,2],
    [3,4,5],
    [6,7,8],
    # column wins
    [0,3,6],
    [1,4,7],
    [2,5,8],
    # diagonal wins
    [0,4,8],
    [2,4,6]
  ]
end
