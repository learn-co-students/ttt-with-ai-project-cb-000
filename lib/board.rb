class Board



  def initialize
    @board = Array.new(9, " ")
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "


  end

  def cells
    @board
  end

  def reset!
    @board = Array.new(9, " ")
  end

  def cells=(array)
    @board = array
  end

  def position(index)

    @board[index.to_i-1]

  end

  def full?
    if @board.any? {|x| x == " "}
      false
    elsif  won? == false && !@board.any? {|x| x == " " }
      true
    end

  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def won?
    arrayX = []
    arrayO = []
    i = 0
    while i < self.cells.length
      if self.cells[i] == "X"
        arrayX << i
      elsif self.cells[i] == "O"
        arrayO << i
      end


      i += 1
    end

    return false if self.cells.all? {|x| x == " " }
    WIN_COMBINATIONS.each { |comb| return "X" if comb.all? { |x| arrayX.include?(x) }}
    WIN_COMBINATIONS.each { |comb| return "O" if comb.all? { |x| arrayO.include?(x) }}

    false

  end

  def draw?
      if self.full? == true && self.won? == false
        true
      else
        false
      end
  end
  def over?
      return true if full?
      return true if won? != false
      return true if draw? == true
      false
  end



  def taken?(index)
     return false if @board[index.to_i-1] == " "
     true
  end

  def valid_move?(index)
    return false if !(index.to_i-1).between?(0,8)
    (index.to_i-1).between?(0,8) && !taken?(index)
  end

  def turn_count
    counter = 0
    @board.each { |x| counter += 1 if x != " " }
    counter
  end



  def update(index, current_player)
    @board[index.to_i-1] = current_player.token
  end


end
