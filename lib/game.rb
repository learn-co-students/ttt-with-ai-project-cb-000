class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]].freeze

  def initialize(player1 = Players::Human.new('X'),
                 player2 = Players::Human.new('O'),
                 board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |c|
      next if @board.cells[c[0]] == ' ' || @board.cells[c[1]] == ' ' || @board.cells[c[2]] == ' '
      @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[1]] == @board.cells[c[2]]
    end
  end

  def draw?
    return true if @board.full? && !won?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
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