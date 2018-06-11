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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end


  def won?
    x = WIN_COMBINATIONS.detect do |wins|
      wins.all? {|win| @board.cells[win] == "X"}
    end
    o = WIN_COMBINATIONS.detect do |wins|
      wins.all? {|win| @board.cells[win] == "O"}
    end
    if x != nil
      x
    elsif o != nil
      o
    else
      false
    end
  end

  def draw?
    !won? && @board.full? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    x = WIN_COMBINATIONS.detect do |wins|
      wins.all? {|win| @board.cells[win] == "X"}
    end
    o = WIN_COMBINATIONS.detect do |wins|
      wins.all? {|win| @board.cells[win] == "O"}
    end
    if x != nil
      "X"
    elsif o != nil
      "O"
    else
      nil
    end
  end


  def turn
    player = current_player
    x = player.move(@board)
    while @board.valid_move?(x) == false
      x = player.move(@board)
    end
    @board.update(x, player)
  end


  def play
    while over? == false
      @board.display
      puts "\n\n"
      turn
    end
    @board.display
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"

  end





end
