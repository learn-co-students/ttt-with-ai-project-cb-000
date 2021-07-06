class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],
                      [2,5,8], [0,4,8], [6,4,2]]
  attr_accessor :player_1, :player_2, :board
  def initialize(player_1=Players::Human.new("X"),
                 player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    cells_left = board.cells.select{|x| x == " "}.length
    cells_left.odd? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |c|
      values = [ board.cells[c[0]], board.cells[c[1]], board.cells[c[2]] ]
      return c if values == ["X", "X", "X"] || values == ["O", "O", "O"]
    end
    false
  end

  def draw?
    if board.cells.all?{|cell| cell == "X" || cell == "O"}
      return won? ? false : true
    end
    false
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      values = [board.cells[won?[0]], board.cells[won?[0]], board.cells[won?[0]]]
      values == ["X", "X", "X"] ? "X" : "O"
    end
  end

  def turn
    move = current_player.move(board)
    board.update(move, current_player)
  end

  # def play
  #   if !over?
  #     turn
  #   end
  #   if over?
  #     if won?
  #       puts "Congratulations #{winner}!"
  #     elsif draw?
  #       puts "Cat\'s Game!"
  #     end
  #   end
  # end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

end
