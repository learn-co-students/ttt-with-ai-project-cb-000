class Game
  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [2, 5, 8],
                      [1, 4, 7],
                      [0, 4, 8],
                      [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    player_1.token == board.token ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
      WIN_COMBINATIONS.any? do |combo|
        if @board.cells[combo[0]] != " " &&
           @board.cells[combo[0]] == @board.cells[combo[1]] &&
           @board.cells[combo[1]] == @board.cells[combo[2]]
          return [combo[0],combo[1],combo[2]]
        end
      end
      return nil
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
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
