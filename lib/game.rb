class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    return player_1 if board.turn_count == 0 || board.turn_count.even?
    player_2
  end

  def over?
    self.board.full? || won?
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
          board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
          (board.cells[win_combo[0]] == 'X' || board.cells[win_combo[0]] == 'O')
          #board.cells[win_combo[1]] != ' ' &&
          #board.cells[win_combo[2]] != ' '
        return win_combo 
      end
    end
    false
  end

  def draw?
    self.board.full? && won? == false
  end

  def winner
    return nil unless won?
    self.board.cells[won?[0]]
  end

  def turn
    loop do
      cell = current_player.move(self.board)
      board.update(cell, current_player) && break if board.valid_move?(cell)
    end
  end

  def play
    while not over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
