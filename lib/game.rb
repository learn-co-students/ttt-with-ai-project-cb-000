class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new('X')
    @player_2 = player_2 || Players::Human.new('O')
    @board = board || Board.new
  end

  # assuming that Player 1 goes first
  def current_player
    (self.board.cells.count {|val| val == 'X' || val == 'O'}.even?)? self.player_1 : self.player_2
  end

  def over?
    self.board.full?
  end

  def won?
    xs = player_positions(self.player_1)
    os = player_positions(self.player_2)
    (winner?(xs))? true : (winner?(os))? true : false
  end

  def draw?
    self.over? && !self.won?
  end

  def winner
    (winner?(player_positions(self.player_1)))? self.player_1.token : (winner?(player_positions(self.player_2)))? self.player_2.token : nil
  end

  def turn
    current_player = self.current_player
    next_move = current_player.move(self.board)
    if self.board.valid_move?(next_move)
      self.board.update(next_move, current_player)
      puts "Player #{current_player.token} makes a move"
      puts '---------------------'
      self.board.display
      puts
    else
      turn
    end
  end

  def play
    until self.won? || self.draw?
      self.turn
    end
    puts (self.won?)? "Congratulations #{self.winner}!" : 'Cat\'s Game!'
    puts
  end

  def play_demo
    until self.won? || self.draw?
      sleep(1)
      self.turn
    end
    puts (self.won?)? "Congratulations #{self.winner}!" : 'Cat\'s Game!'
    puts
  end

  private # helper methods
  def winner?(player_positions)
    WIN_COMBINATIONS.detect do |combination|
      combination.all? do |position|
        player_positions.include?(position)
      end
    end
  end

  def player_positions(player)
    result = []
    self.board.cells.each_with_index {|val, i| result << i if val == player.token}
    result
  end

end
