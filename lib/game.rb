class Game
  attr_accessor :player_1, :player_2, :board
  #attr_reader :WIN_COMBINATIONS
  WIN_COMBINATIONS =  [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]

  def initialize(a="dil", b="bil", c="cil")
    if a == "dil"
      @player_1 = Players::Human.new("X")
    else
      @player_1 = a
    end
    if b == "bil"
      @player_2 = Players::Human.new("O")
    else
      @player_2 = b
    end
    if c == "cil"
      @board = Board.new
      @board.cells = Array.new(9, " ")
    else
      @board = c
    end
  end

  def turn_count
    turn = 0
    @board.cells.each do |spot|
      if spot == " " || spot == "" || spot == nil
        turn += 0
      else
        turn += 1
      end
    end
  return turn
  end

  def current_player
    turns_elapsed = turn_count
    if turns_elapsed % 2 != 0
      return @player_2
    else
      return @player_1
    end
  end

  def x_won?(win_combo)
    win_combo.all? do |index|
      @board.cells[index] == "X"
    end
  end

  def o_won?(win_combo)
    win_combo.all? do |index|
      @board.cells[index] == "O"
    end
  end

  def won?
    winner = []
    WIN_COMBINATIONS.each do |win_combo|
      if x_won?(win_combo) == true
        winner = win_combo
      elsif o_won?(win_combo) == true
        winner = win_combo
      end
    end
    if winner == []
      return false
    end
    return winner
  end

  def full?
    @board.cells.all? do |space|
      space == 'X' || space == 'O'
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if won? != false
      return true
    elsif full? == true
      return true
    elsif draw? == true
      return true
    else
      return false
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def winner
    value = won?
    if value == false
      return nil
    else
      something = value[0]
      spot = @board.cells[something]
      if spot == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def turn
    dex = 0
    token = current_player
    loop do
      puts "Please enter 1-9:"
      dex = current_player.move(@board).to_i
      break if @board.valid_move?(dex)
    end
    @board.update( dex, token)
    #display_board
  end

  def play
    until over? == true
      turn
    end
    if winner == nil
      puts "Cat's Game!"
    elsif winner == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end

end
